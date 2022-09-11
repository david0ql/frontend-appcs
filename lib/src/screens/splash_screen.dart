import 'package:appcs/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2500), () {
      UserPreferences.tipoRol != 0
          ? Navigator.pushReplacementNamed(context, 'home')
          : Navigator.pushReplacementNamed(context, 'login');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Lottie.asset("assets/animation_splash.json")),
      ),
    );
  }
}
