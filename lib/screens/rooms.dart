import 'package:flutter/material.dart';
import 'roomdetails.dart'; // Import the RoomDetailPage
import 'droom.dart'; // Import the DeluxeRoomDetailPage
import 'doublestandard.dart'; // Import the DoubleStandardRoomDetailPage

class RoomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown[100], // Background color for the entire screen
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Stack to extend the image to the top with back button and text
              Stack(
                children: [
                  Image.asset(
                    'assets/roomtile.jpg', // Updated to new image file
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  // Back button in the top-left corner
                  Positioned(
                    top: 40.0,
                    left: 16.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  // "Rooms & Rates" text in the middle of the image, made bigger
                  Positioned(
                    left: 16.0,
                    bottom: 20.0,
                    child: Text(
                      'Rooms & Rates',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0, // Increased font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              // Facilities Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FacilityIcon(icon: Icons.kitchen, label: 'Kitchen'),
                    FacilityIcon(icon: Icons.pool, label: 'Pool'),
                    FacilityIcon(icon: Icons.wifi, label: 'WiFi'),
                    FacilityIcon(icon: Icons.fitness_center, label: 'Gym'),
                    FacilityIcon(icon: Icons.local_taxi, label: 'Taxi'),
                  ],
                ),
              ),
              // Rooms List
              RoomItem(
                imagePath: 'assets/rooms1.jpg',
                roomTitle: 'Standard Room',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RoomDetailPage()), // Navigate to RoomDetailPage
                  );
                },
              ),
              RoomItem(
                imagePath: 'assets/rooms2.jpg',
                roomTitle: 'Double Standard Room',
                onPressed: () {
                  // Navigate to DoubleStandardRoomDetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DoubleStandardRoomDetailPage()),
                  );
                },
              ),
              RoomItem(
                imagePath: 'assets/rooms3.jpg',
                roomTitle: 'Deluxe Room',
                onPressed: () {
                  // Navigate to DeluxeRoomDetailPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DeluxeRoomDetailPage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacilityIcon extends StatelessWidget {
  final IconData icon;
  final String label;

  FacilityIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 32.0, color: Colors.brown[400]),
        SizedBox(height: 8.0),
        Text(
          label,
          style:
              TextStyle(color: Colors.brown[400], fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class RoomItem extends StatelessWidget {
  final String imagePath;
  final String roomTitle;
  final VoidCallback onPressed; // Function parameter for navigation

  RoomItem({required this.imagePath, required this.roomTitle, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      child: Card(
        color: Colors.brown[50], // Light brown background for cards
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            // Image on the left side
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                imagePath,
                width: 120, // Fixed width for all images
                height: 120, // Fixed height for all images
                fit: BoxFit.cover,
              ),
            ),
            // Description and button on the right side
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomTitle,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.brown[300], // Brown button background
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                          ),
                        ),
                        onPressed: onPressed, // Call the function when pressed
                        icon: Icon(Icons.arrow_forward,
                            color: Colors.white), // White arrow
                        label: Text(
                          'Check Rates',
                          style: TextStyle(color: Colors.white), // White text
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}