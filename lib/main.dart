// lib/main.dart
import 'package:aesthetic_shop/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/home_screen.dart';
// TODO: سنستورد home_screen لاحقًا

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aesthetic Shop',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Suwannaphum'),
      initialRoute: '/', // الطريق الأولي
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/signin': (context) => const SignInScreen(),
        '/home': (context) => HomeScreen(),
        // TODO: إضافة '/signin' و '/home' لاحقًا
      },
    );
  }
}
