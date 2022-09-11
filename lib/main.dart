import 'package:appcs/src/providers/bottom_provider.dart';
import 'package:appcs/src/providers/people_service.dart';
import 'package:appcs/src/screens/screens.dart';
import 'package:appcs/src/theme/app_theme.dart';
import 'package:appcs/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PeopleService>(
          create: ((context) => PeopleService()),
          lazy: false,
        ),
        ChangeNotifierProvider<BottomProvider>(
          create: ((context) => BottomProvider()),
          lazy: false,
        ),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CS',
      initialRoute: 'splash',
      routes: {
        'splash': (context) => const SplashScreen(),
        'home': (context) => const HomeScreen(),
        'login': (context) => const LoginScreen()
      },
      theme: AppTheme.themeData,
    );
  }
}
