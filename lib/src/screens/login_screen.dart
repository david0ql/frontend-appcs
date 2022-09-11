import 'dart:convert';
import 'dart:developer';
import 'package:appcs/src/user_preferences/user_preferences.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../auth/auth_config.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Inicio de sesion cancelado'),
    );
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/wallpaper.jpg"),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(
                    padding: EdgeInsets.all(30),
                    child: Image(image: AssetImage("assets/logo_uts.png"))),
                _LoginButton(
                  heightScreen: size.height,
                  snackBar: snackBar,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  final SnackBar snackBar;
  const _LoginButton({
    Key? key,
    required this.heightScreen,
    required this.snackBar,
  }) : super(key: key);

  final double heightScreen;

  @override
  Widget build(BuildContext context) {
    FlutterAppAuth appAuth = const FlutterAppAuth();
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      child: Column(
        children: [
          DecoratedBox(
            decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 10, 14, 10),
                  Color(0XFF1f4d1e)
                ]),
                borderRadius: BorderRadius.circular(100)),
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              child: TextButton(
                onPressed: () async {
                  try {
                    final result = await appAuth.authorizeAndExchangeCode(
                      AuthorizationTokenRequest(
                          AuthConfig.clientId, AuthConfig.redirectUrl,
                          serviceConfiguration:
                              AuthConfig.authorizationServiceConfiguration,
                          scopes: AuthConfig.scopes),
                    );
                    final idToken = result!.idToken;
                    final accessToken = result.accessToken;
                    String uri = 'https://graph.microsoft.com/v1.0/me';
                    Map<String, String> headers = {
                      'Authorization': '$accessToken',
                    };
                    headers.addAll({'responseType': 'arrayBuffer'});
                    final response = await http
                        .get(Uri.parse("$uri/photo/\$value"), headers: headers);
                    final printableString = base64.encode(response.bodyBytes);
                    Map<String, dynamic> decodedToken =
                        JwtDecoder.decode(idToken!);
                    UserPreferences.photo = printableString;
                    UserPreferences.name =
                        decodedToken["name"].replaceAll(RegExp('\\s+'), ' ');
                    UserPreferences.correo = decodedToken["preferred_username"];
                    final String correoRecibir =
                        decodedToken["preferred_username"];
                    final idTipoToken = correoRecibir
                        .substring(correoRecibir.lastIndexOf("@") + 1);
                    if (idTipoToken == "uts.edu.co") {
                      UserPreferences.tipoRol = 1;
                    } else {
                      UserPreferences.tipoRol = 2;
                    }
                    //ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, 'home');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Column(
                  children: [
                    Text("Iniciar sesion",
                        style: TextStyle(
                            fontSize: heightScreen * 0.03,
                            color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "con cuenta de correo institucional",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
