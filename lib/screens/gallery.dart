import 'dart:math';
import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of image paths
    final List<String> imagePaths = [
      'assets/wed2.jpg',
      'assets/wed3.jpg',
      'assets/wed4.jpg',
      'assets/wedding.jpg',
      'assets/party.jpg',
      'assets/bday.jpg',
      'assets/cele.jpg',
      'assets/dinner.jpg',
      'assets/gym.jpg',
      'assets/hall.jpg',
      'assets/hotel.jpg',
      'assets/rd2.jpg',
      'assets/g.jpg',
      'assets/g1.jpg',
      'assets/g2.jpg',
      'assets/g3.jpg',
      'assets/g4.jpg',
      'assets/g5.jpg',
      'assets/g6.jpg',
      'assets/g7.jpg',
      'assets/g8.jpg',
    ];

    // Shuffle the images
    imagePaths.shuffle(Random());

    return Scaffold(
      body: Container(
        color: Colors.brown.shade100, // Light brown background for the whole page
        child: Column(
          children: [
            const SizedBox(height: 30), // Space between top and heading container
            // Rectangle heading container with "Gallery" title
            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.brown.shade600, Colors.brown.shade400],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10.0), // Rounded corners for the rectangle
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(0, 4),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10.0),
                  const Text(
                    'Some past memories..',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0), // Space between heading and images
            // Grid of shuffled images
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  children: imagePaths.map((image) => _buildGalleryImage(image)).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build gallery image widget
  Widget _buildGalleryImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}