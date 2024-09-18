/*import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/login.dart';
import 'screens/custlogin.dart';
import 'screens/employee_login_page.dart'; // Employee Login Page
import 'screens/signup_page.dart'; // Signup Page
//import 'screens/splash_page.dart'; // Splash Page
import 'screens/home_page.dart'; // Home Page
import 'screens/resetpass.dart'; // Reset Password Page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Management System',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route to splash screen
      routes: {
        '/': (context) => SplashScreen(), // Splash Page
        '/home': (context) => const HomePage(), // Home Page
        '/login': (context) => const LoginScreen(), // Login Page
        '/custlogin': (context) => const CustLoginScreen(),
        '/signup': (context) => const SignupPage(), // Signup Page
        '/resetpass': (context) =>
            const ResetPassScreen(), // Reset Password Page
      },
    );
  }
}*/
import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/login.dart';
import 'screens/custlogin.dart';
import 'screens/employee_login_page.dart'; // Employee Login Page
import 'screens/signup_page.dart'; // Signup Page
import 'screens/home_page.dart'; // Home Page
import 'screens/resetpass.dart'; // Reset Password Page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Management System',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // Set initial route to splash screen
      routes: {
        '/': (context) => SplashScreen(), // Splash Page
        '/home': (context) => const HomePage(), // Home Page
        '/login': (context) => const LoginScreen(), // Login Page
        '/custlogin': (context) => const CustLoginScreen(),
        '/emplogin': (context) =>
            const EmployeeLoginPage(), // Employee Login Page
        '/signup': (context) => const SignupPage(), // Signup Page
        '/resetpass': (context) =>
            const ResetPassScreen(), // Reset Password Page
      },
    );
  }
}
