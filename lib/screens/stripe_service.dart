// Import Material package to access Navigator
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'consts.dart'; // Replace with your actual import
import 'package:dio/dio.dart';
import '../screens/success.dart'; // Adjust the path based on your folder structure

class StripeService {
  StripeService._();

  static final StripeService instance = StripeService._();

  Future<void> makePayment(
      int amount, String currency, BuildContext context) async {
    try {
      String? paymentIntentClientSecret =
          await _createPaymentIntent(amount, currency);
      if (paymentIntentClientSecret == null) return;

      // Initialize the payment sheet
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: "Pearl Dias", // Replace with your business name
        ),
      );

      // Present the payment sheet
      await Stripe.instance.presentPaymentSheet();

      // Confirm the payment
      await Stripe.instance.confirmPaymentSheetPayment();

      // If payment is successful, show the success message
      _showSuccessMessage(context);
    } catch (e) {
      print(e);
      throw Exception("Payment failed");
    }
  }

  // Create Payment Intent
  Future<String?> _createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();
      Map<String, dynamic> data = {
        "amount": _calculateAmount(amount),
        "currency": currency,
      };
      var response = await dio.post(
        "https://api.stripe.com/v1/payment_intents",
        data: data,
        options: Options(
          headers: {
            "Authorization": "Bearer $stripeSecretKey",
            "Content-Type": 'application/x-www-form-urlencoded'
          },
        ),
      );
      if (response.data != null) {
        return response.data["client_secret"];
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Calculate amount in cents
  String _calculateAmount(int amount) {
    final calculatedAmount = amount * 100; // Stripe uses cents
    return calculatedAmount.toString();
  }

  // Show success message and navigate to home page
  void _showSuccessMessage(BuildContext context) {
    // Display a success message using a SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment successful! Redirecting to home...'),
        duration: Duration(seconds: 3),
      ),
    );

    // Wait for 3 seconds before navigating to the home page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
          context, '/home'); // Replace '/home' with your home route
    });
  }
}
