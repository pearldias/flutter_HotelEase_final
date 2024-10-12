import 'package:flutter/material.dart';
import 'screens/splash_page.dart';
import 'screens/login.dart';
import 'screens/menu.dart'; // Import for MenuScreen
import 'screens/aboutus.dart'; // Import the AboutUs screen
import 'screens/customer.dart'; // Import for CustomerScreen
import 'screens/booking.dart'; // Import for BookingForm (BookingAndPaymentScreen)
import 'screens/feedback.dart'; // Import for FeedbackScreen
import 'screens/user.dart';
import 'screens/roomservice.dart';
import 'screens/foodmenu.dart';
import 'screens/notification.dart'; 
import 'screens/paymenttype.dart';
import 'screens/roomdetails.dart';
import 'screens/rooms.dart'; // Import for RoomsPage, remove BookingForm import here
import 'screens/amenities.dart';
import 'screens/gallery.dart'; // Import the GalleryPage
import 'screens/custlogin.dart';
import 'screens/employee_login_page.dart';
import 'screens/dashboard.dart';
import 'screens/editprofile.dart';
import 'screens/editcust.dart'; // Import EditProfileScreen class
import 'screens/droom.dart';
import 'screens/doublestandard.dart';
import 'screens/empfeedback.dart';
import 'screens/profilesetting.dart';
import 'screens/signup_page.dart'; // Signup Page
import 'screens/home_page.dart'; // Home Page
import 'screens/resetpass.dart'; // Reset Password Page
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
        '/emplogin': (context) => const EmployeeLoginPage(), // Employee Login Page
        '/signup': (context) => const SignupPage(), // Signup Page
        '/resetpass': (context) => const ResetPassScreen(), // Reset Password Page
        '/customer_home': (context) => const CustomerScreen(),
        '/menu': (context) => MenuScreen(),
        '/bookingAndPayment': (context) => BookingForm(), // BookingForm route
        '/feedback': (context) => FeedbackScreen(),
        '/user': (context) => UserProfile(),
        '/success': (context) => SuccessScreen(), // SuccessScreen route
        '/about': (context) => AboutUs(), // Route for the AboutUs screen
        '/gallery': (context) => GalleryPage(), // Add GalleryPage route here
        '/amenities': (context) => AmenitiesPage(),
        '/roomdetails': (context) => RoomDetailPage(),
        '/payment': (context) => PaymentPage(),
        '/rooms': (context) => RoomsPage(), // Route for RoomsPage
        '/roomService': (context) => RoomService(),
        '/foodMenu': (context) => FoodMenu(),
        '/dashboard': (context) => DashboardPage(),
        '/employeeFeedback': (context) => EmployeeFeedbackPage(),
        '/notification': (context) => NotificationPage(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/editcustprofile': (context) => EditcustProfileScreen(),
        '/deluxe-room': (context) => DeluxeRoomDetailPage(),
      },
    );
  }
}