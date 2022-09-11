import 'package:appcs/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              UserPreferences.correo = "";
              UserPreferences.name = "";
              UserPreferences.photo = "";
              UserPreferences.tipoRol = 0;
              Navigator.pushReplacementNamed(context, 'login');
            },
            child: const Text("Cerrar Sesion")),
      ),
    );
  }
}
