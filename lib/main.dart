import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'screens/splash_page.dart';
import 'screens/login.dart';
import 'screens/menu.dart';
import 'screens/aboutus.dart';
import 'screens/customer.dart';
import 'screens/contact.dart';
import 'screens/booking.dart';
import 'screens/feedback.dart';
import 'screens/user.dart';
import 'screens/roomservice.dart';
import 'screens/foodmenu.dart';
import 'screens/notification.dart';
import 'screens/paymenttype.dart';
import 'screens/roomdetails.dart';
import 'screens/rooms.dart';
import 'screens/amenities.dart';
import 'screens/gallery.dart';
import 'screens/custlogin.dart';
import 'screens/employee_login_page.dart';
import 'screens/dashboard.dart';
import 'screens/map.dart';
import 'screens/droom.dart';
import 'screens/doublestandard.dart';
import 'screens/empfeedback.dart';
import 'screens/profilesetting.dart';
import 'screens/signup_page.dart';
import 'screens/homepage.dart';
import 'screens/resetpass.dart';
import 'screens/success.dart';
import 'screens/guestcust.dart';
import 'screens/guestmenu.dart';
import 'screens/guestrooms.dart';
// Import for platform detection
import 'package:flutter/foundation.dart' show kIsWeb; // For web check
import 'dart:io' show Platform; // For mobile platforms (iOS, Android)

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Setup Stripe publishable key for Android/iOS platforms
  if (!kIsWeb && (Platform.operatingSystem == 'android' || Platform.operatingSystem == 'ios')) {
    Stripe.publishableKey =
      'pk_test_51QAAdiDMc8FWAaqGsxEZbl6ClJrQQ4UurxmaxEamo7266TDCrkcHYyPGeUAZlg7rpDQ7lpVE2l9krZAXAyD47Rw700z98pfBso';
    // Add other Stripe-related initializations here
  }

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
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginScreen(),
        '/custlogin': (context) => const CustLoginScreen(),
        '/emplogin': (context) => const EmployeeLoginPage(),
        '/signup': (context) => const SignupPage(),
        '/resetpass': (context) => const ResetPassScreen(),
        '/customer_home': (context) => CustomerScreen(),
        '/menu': (context) => MenuScreen(),
        '/bookingAndPayment': (context) => BookingForm(),
        '/feedback': (context) => FeedbackScreen(),
        '/user': (context) => UserProfile(),
        '/success': (context) => SuccessScreen(),
        '/about': (context) => AboutUs(),
        '/gallery': (context) => GalleryPage(),
        '/amenities': (context) => AmenitiesPage(),
        '/roomdetails': (context) => RoomDetailPage(),
        '/payment': (context) => PaymentPage(),
        '/rooms': (context) => RoomsPage(),
        '/roomService': (context) => RoomService(),
        '/foodMenu': (context) => FoodMenu(),
        '/dashboard': (context) => DashboardPage(),
        '/employeeFeedback': (context) => EmployeeFeedbackPage(),
        '/notification': (context) => NotificationPage(),
        '/deluxe-room': (context) => DeluxeRoomDetailPage(),
        '/double-standard-room': (context) => DoubleStandardRoomDetailPage(),
        '/contact': (context) => const ContactPage(),
        '/location': (context) => HotelAddPage(),
        '/guestcust': (context) => const GuestCustomerScreen(),
        '/guestMenu': (context) => const GuestMenuScreen(),
      },
    );
  }
}