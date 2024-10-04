import 'package:flutter/material.dart';
import 'customer.dart'; // Import the CustomerScreen class

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define padding for top, bottom, left, and right
    const double verticalPadding = 30.0; // 3cm is roughly 30 pixels
    const double horizontalPadding = 20.0; // 2cm is roughly 20 pixels
    const double buttonHorizontalPadding = 30.0; // Padding for the button (3cm)

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'), // Adjust path as necessary
                fit: BoxFit.cover,
              ),
            ),
          ),
          // White card-like container with rounded corners
          Padding(
            padding: EdgeInsets.only(
              top: verticalPadding,
              bottom: verticalPadding,
              left: horizontalPadding,
              right: horizontalPadding,
            ),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - (2 * verticalPadding), // Occupy almost full height
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content
                children: [
                  // Success Icon
                  Icon(
                    Icons.check_circle_outline,
                    size: 60,
                    color: Colors.brown,
                  ),
                  const SizedBox(height: 20),
                  // Success text
                  Text(
                    'successful',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black.withOpacity(0.7),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // Return to Home button with horizontal padding
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: buttonHorizontalPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.brown,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          // Navigate to CustomerScreen
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => const CustomerScreen()),
                          );
                        },
                        child: const Text(
                          'return to home page',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}