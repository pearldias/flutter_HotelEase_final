import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top part with "Gallery" title
          Container(
            height: 100, // Adjust height for the title section
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 16.0, bottom: 10.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.brown),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10.0), // Small spacing between icon and text
                Text(
                  'Gallery',
                  style: TextStyle(
                    color: Colors.brown, // Brown text color
                    fontSize: 28.0, // Font size for the title
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Grid of images below the title
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 3, // 3 images per row
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: [
                  _buildGalleryImage('assets/wed2.jpg'),
                  _buildGalleryImage('assets/wed3.jpg'),
                  _buildGalleryImage('assets/wed4.jpg'),
                  _buildGalleryImage('assets/wedding.jpg'),
                  _buildGalleryImage('assets/party.jpg'),
                  _buildGalleryImage('assets/bday.jpg'),
                  _buildGalleryImage('assets/cele.jpg'),
                  _buildGalleryImage('assets/dinner.jpg'),
                  _buildGalleryImage('assets/gym.jpg'),
                  _buildGalleryImage('assets/hall.jpg'),
                  _buildGalleryImage('assets/hotel.jpg'),
                  _buildGalleryImage('assets/rd2.jpg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to build a gallery image widget
  Widget _buildGalleryImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
    );
  }
}
