import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/login.dart';
import 'screens/menu.dart'; // Import for MenuScreen
import 'screens/customer.dart'; // Import for CustomerScreen
import 'screens/booking.dart'; // Import for BookingAndPaymentScreen
import 'screens/feedback.dart'; // Import for FeedbackScreen
import 'screens/user.dart';
import 'screens/custlogin.dart';
import 'screens/employee_login_page.dart'; // Employee Login Page
import 'screens/signup_page.dart'; // Signup Page
import 'screens/home_page.dart'; // Home Page
import 'screens/resetpass.dart'; // Reset Password Page
import 'screens/customer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:app/screens/success.dart';  // If success.dart is located in screens

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/customer_home': (context) => const CustomerScreen(),
        '/menu': (context) => MenuScreen(),
        '/bookingAndPayment': (context) => BookingForm(),
        '/feedback': (context) => FeedbackScreen(),
        '/user': (context) => UserProfile(),
        '/success': (context) => SuccessScreen(), // SuccessScreen route
      },
    );
  }
}