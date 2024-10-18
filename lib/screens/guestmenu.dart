import 'package:flutter/material.dart';
import 'user.dart'; // Import the UserProfile screen
import 'login.dart'; // Import the LoginScreen
import 'aboutus.dart'; // Import the AboutUs screen
import 'gallery.dart'; // Import the GalleryPage
import 'amenities.dart'; // Import the AmenitiesPage
import 'contact.dart'; // Import the ContactPage
import 'map.dart'; // Import the HotelAddPage

class GuestMenuScreen extends StatefulWidget {
  const GuestMenuScreen({Key? key}) : super(key: key);

  @override
  _GuestMenuScreenState createState() => _GuestMenuScreenState();
}

class _GuestMenuScreenState extends State<GuestMenuScreen> {
  final TextEditingController _guestSearchController = TextEditingController();
  List<String> guestMenuOptions = [
    'Home',
    'About Us',
    'Gallery',
    'Amenities',
    'Location', // Added Location option
    'Contact Us',
  ];
  List<String> filteredGuestOptions = [];

  @override
  void initState() {
    super.initState();
    filteredGuestOptions = guestMenuOptions; // Initialize filteredGuestOptions with all options
  }

  void _filterGuestOptions(String query) {
    setState(() {
      filteredGuestOptions = guestMenuOptions
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
                            controller: _guestSearchController,
                            onChanged: _filterGuestOptions, // Call filter on change
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
                    children: filteredGuestOptions.map((option) {
                      return _buildGuestMenuButton(context, option);
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

  // Helper method to create each button in the guest menu
  Widget _buildGuestMenuButton(BuildContext context, String title) {
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