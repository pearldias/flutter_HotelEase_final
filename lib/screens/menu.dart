import 'package:flutter/material.dart';
import 'user.dart'; // Import the UserProfile screen
import 'login.dart'; // Import the LoginScreen
import 'aboutus.dart'; // Import the AboutUs screen
import 'gallery.dart'; // Import the GalleryPage
import 'amenities.dart'; // Import the AmenitiesPage

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/bg.jpg'), // Ensure the asset path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Search bar similar to customer screen
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.search, color: Colors.brown),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search in Menu...',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.menu, color: Colors.brown),
                      ],
                    ),
                  ),
                ),

                // Menu buttons
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 20),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Aligning to the left
                    children: [
                      _buildMenuButton(context, 'Home'),
                      _buildMenuButton(
                          context, 'About Us'), // "About Us" button
                      _buildMenuButton(context, 'Gallery'),
                      _buildMenuButton(context, 'Amenities'),
                      _buildMenuButton(context, 'Profile'),
                      _buildMenuButton(context, 'Logout'), // Logout button
                      _buildMenuButton(
                          context, 'Contact Us'), // Added "Contact Us"
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to create each button in the menu
  Widget _buildMenuButton(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: Alignment.centerLeft, // Ensures button is left-aligned
        child: SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(
                  0.8), // Use `backgroundColor` instead of `primary`
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              if (title == 'Home') {
                Navigator.pop(context); // Navigate back to CustomerScreen
              } else if (title == 'Profile') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          UserProfile()), // Navigate to UserProfile screen
                );
              } else if (title == 'Logout') {
                // Navigate to the LoginScreen when Logout is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LoginScreen()), // Navigate to login screen
                );
              } else if (title == 'About Us') {
                // Navigate to the AboutUs screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AboutUs()), // Navigate to AboutUs screen
                );
              } else if (title == 'Gallery') {
                // Navigate to the GalleryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          GalleryPage()), // Navigate to GalleryPage
                );
              } else if (title == 'Amenities') {
                // Navigate to the AmenitiesPage screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AmenitiesPage()), // Navigate to AmenitiesPage
                );
              } else if (title == 'Contact Us') {
                // Navigate to Contact Us or perform some action
              }
            },
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
