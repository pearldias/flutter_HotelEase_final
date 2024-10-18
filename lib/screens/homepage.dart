import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 92, 68, 49), // Background color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo image at the top, centered
              ClipOval(
                child: Image.asset(
                  'assets/logo.jpg',
                  height: 100, // Set height for the logo image
                  width: 100, // Set width for the logo image
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 10.0), // Reduced space between logo and title
              // Title above the first row of images
              Text(
                'HOTELEASE',
                style: TextStyle(
                  fontSize: 24.0, // Font size for the title
                  fontWeight: FontWeight.bold, // Bold font
                  color: Colors.white, // White text color
                ),
                textAlign: TextAlign.center, // Center the text
              ),
              SizedBox(height: 57.0), // 1.5 cm gap between title and images
              // Row 1: Three images
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage('assets/1.jpg'),
                  SizedBox(width: 8.0), // Space between images
                  buildImage('assets/2.jpg'),
                  SizedBox(width: 8.0), // Space between images
                  buildImage('assets/3.jpg'),
                ],
              ),
              SizedBox(height: 8.0), // Space between rows
              // Row 2: Three images
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage('assets/4.jpg'),
                  SizedBox(width: 8.0), // Space between images
                  buildImage('assets/5.jpg'),
                  SizedBox(width: 8.0), // Space between images
                  buildImage('assets/6.jpg'),
                ],
              ),
              SizedBox(height: 8.0), // Space between rows
              // Row 3: Single image
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildImage('assets/7.jpg'), // Center large image
                ],
              ),
              SizedBox(height: 20.0), // Space between images and text
              // Text below the images
              Text(
                '”Continue to find the perfect room for your stay!”',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white, // White text color
                  fontStyle: FontStyle.italic, // Italic font for the quote
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0), // Space between text and button
              // Continue button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/login'); // Navigate to the login page
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 16.0), // Larger padding
                  backgroundColor:
                      Color.fromARGB(255, 43, 34, 28), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Continue',
                      style: TextStyle(
                          fontSize: 18.0,
                          color:
                              Colors.white), // Larger font size and white color
                    ),
                    SizedBox(width: 8.0), // Space between text and arrow
                    Icon(Icons.arrow_forward,
                        color: Colors.white), // White arrow
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // Helper method to build images with curved corners
  Widget buildImage(String assetPath, {bool large = false}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0), // Rounded corners
      child: Image.asset(
        assetPath,
        width: large ? 180 : 120, // Uniform size for images
        height: large ? 180 : 120,
        fit: BoxFit.cover,
      ),
    );
  }
}