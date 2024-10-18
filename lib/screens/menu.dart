import 'package:flutter/material.dart';
import 'user.dart'; // Import the UserProfile screen
import 'login.dart'; // Import the LoginScreen
import 'aboutus.dart'; // Import the AboutUs screen
import 'gallery.dart'; // Import the GalleryPage
import 'amenities.dart'; // Import the AmenitiesPage
import 'contact.dart'; // Import the ContactPage
import 'map.dart'; // Import the HotelAddPage

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> menuOptions = [
    'Home',
    'About Us',
    'Gallery',
    'Amenities',
    'Location', // Added Location option
    'Profile',
    'Logout',
    'Contact Us',
  ];
  List<String> filteredOptions = [];

  @override
  void initState() {
    super.initState();
    filteredOptions = menuOptions; // Initialize filteredOptions with all options
  }

  void _filterOptions(String query) {
    setState(() {
      filteredOptions = menuOptions
          .where((option) => option.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg.jpg'), // Ensure the asset path is correct
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Search bar
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
                      children: [
                        Icon(Icons.search, color: Colors.brown),
                        SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _searchController,
                            onChanged: _filterOptions, // Call filter on change
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
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligning to the left
                    children: filteredOptions.map((option) {
                      return _buildMenuButton(context, option);
                    }).toList(),
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
              backgroundColor: Colors.white, // Set to solid color (no transparency)
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
                    builder: (context) => UserProfile(), // Navigate to UserProfile screen
                  ),
                );
              } else if (title == 'Logout') {
                // Navigate to the LoginScreen when Logout is pressed
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(), // Navigate to login screen
                  ),
                );
              } else if (title == 'About Us') {
                // Navigate to the AboutUs screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUs(), // Navigate to AboutUs screen
                  ),
                );
              } else if (title == 'Gallery') {
                // Navigate to the GalleryPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GalleryPage(), // Navigate to GalleryPage
                  ),
                );
              } else if (title == 'Amenities') {
                // Navigate to the AmenitiesPage screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AmenitiesPage(), // Navigate to AmenitiesPage
                  ),
                );
              } else if (title == 'Location') {
                // Navigate to the LocationPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotelAddPage(), // Navigate to map.dart
                  ),
                );
              } else if (title == 'Contact Us') {
                // Navigate to ContactPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactPage(), // Navigate to ContactPage
                  ),
                );
              }
            },
            child: Text(
              title,
              style: const TextStyle(
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