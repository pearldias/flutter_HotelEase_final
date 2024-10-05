import 'package:flutter/material.dart';
import 'booking.dart'; // Import the BookingPage
class RoomDetailPage extends StatefulWidget {
  @override
  _RoomDetailPageState createState() => _RoomDetailPageState();
}
class _RoomDetailPageState extends State<RoomDetailPage> {
  int _currentImageIndex = 0; // Track the current image index
  final List<String> _imagePaths = [
    'assets/rd1.jpg',
    'assets/rd2.jpg',
    'assets/rd3.jpg',
  ];
  // Create a PageController to control the PageView
  final PageController _pageController = PageController();
  @override
  void dispose() {
    _pageController.dispose(); // Dispose the PageController
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController, // Use the PageController
                    itemCount: _imagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _imagePaths[index],
                        width: double.infinity,
                        height: 250,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    color: Colors.black.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        'Standard Room',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imagePaths.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentImageIndex = index; // Update the index
                    });
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ); // Animate to the selected page
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      backgroundColor: _currentImageIndex == index
                          ? Colors.brown
                          : Colors.grey[300],
                      radius: 30,
                      backgroundImage: AssetImage(_imagePaths[index]),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Room Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconText(
                              icon: Icons.shower,
                              text: 'Shower',
                              color: Colors.black),
                          IconText(
                              icon: Icons.bed,
                              text: '1 Queen Size Bed',
                              color: Colors.black),
                          IconText(
                              icon: Icons.wifi,
                              text: 'Free WiFi',
                              color: Colors.black),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconText(
                              icon: Icons.tv, text: 'TV', color: Colors.black),
                          IconText(
                              icon: Icons.room_service,
                              text: '24/7 Service',
                              color: Colors.black),
                          IconText(
                              icon: Icons.lock,
                              text: 'Safe',
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Cancellation Rules',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Free Cancellation until 22 July',
                      style: TextStyle(color: Colors.black)),
                  Text('After that, USD 50 Fee applies',
                      style: TextStyle(color: Colors.black)),
                  Text('Cancellation made on 26 July is 50% Refundable',
                      style: TextStyle(color: Colors.black)),
                  SizedBox(height: 16),
                  Text(
                    'Price:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Showing prices in plain text
                  Text(
                    'USD 964 3 nights',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'USD 327 1 night',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingForm()), // Navigate to BookingForm
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Brown color for "Book Now" button
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Book Now',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class IconText extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  IconText({required this.icon, required this.text, required this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        SizedBox(width: 8),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}