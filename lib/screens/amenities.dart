import 'package:flutter/material.dart';

class AmenitiesPage extends StatefulWidget {
  @override
  _AmenitiesPageState createState() => _AmenitiesPageState();
}

class _AmenitiesPageState extends State<AmenitiesPage> {
  PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentIndex = 0;

  // List of amenities with image paths and names
  final List<Map<String, String>> amenities = [
    {"image": "assets/spa.jpg", "name": "Spa"},
    {"image": "assets/hk.png", "name": "Housekeeping"},
    {"image": "assets/gym1.jpg", "name": "Gym"},
    {"image": "assets/sp.jpg", "name": "Swimming Pool"},
    {"image": "assets/cp.jpg", "name": "Car Parking"},
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentIndex = _pageController.page!.round();
      });
    });
  }

  void _goToNextPage() {
    if (_currentIndex < amenities.length - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row for the back arrow and heading
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.brown),
                    onPressed: () {
                      Navigator.pop(context); // Navigate back to the previous screen
                    },
                  ),
                  SizedBox(width: 10), // Add spacing between arrow and text
                  Text(
                    'Amenities',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  // Image slider using PageView
                  PageView.builder(
                    controller: _pageController,
                    itemCount: amenities.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0), // Space between images
                        child: Transform.scale(
                          scale: index == _currentIndex ? 1 : 0.9, // Scaling effect for focused image
                          child: Center(
                            child: Image.asset(
                              amenities[index]["image"]!,
                              height: 300, // Reduced height for images
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  // Previous Button
                  Positioned(
                    left: 0,
                    top: MediaQuery.of(context).size.height * 0.35, // Vertically center the button
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.brown, size: 40),
                      onPressed: _goToPreviousPage,
                    ),
                  ),
                  // Next Button
                  Positioned(
                    right: 0,
                    top: MediaQuery.of(context).size.height * 0.35, // Vertically center the button
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.brown, size: 40),
                      onPressed: _goToNextPage,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Brown rectangle container with amenity name
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.brown,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                amenities[_currentIndex]["name"]!, // Displaying only the current amenity
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}