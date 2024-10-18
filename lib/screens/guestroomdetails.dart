import 'package:flutter/material.dart';
class GuestRoomDetailPage extends StatefulWidget {
  @override
  _GuestRoomDetailPageState createState() => _GuestRoomDetailPageState();
}
class _GuestRoomDetailPageState extends State<GuestRoomDetailPage> {
  int _currentGuestImageIndex = 0; // Track the current image index for guest room
  final List<String> _guestImagePaths = [
    'assets/rd1.jpg',
    'assets/rd2.jpg',
    'assets/rd3.jpg',
  ];
  // Create a PageController to control the PageView for guest room
  final PageController _guestPageController = PageController();
  @override
  void dispose() {
    _guestPageController.dispose(); // Dispose the PageController
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
                    controller: _guestPageController, // Use the PageController for guest room
                    itemCount: _guestImagePaths.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentGuestImageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        _guestImagePaths[index],
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
              children: List.generate(_guestImagePaths.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentGuestImageIndex = index; // Update the index for guest room
                    });
                    _guestPageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ); // Animate to the selected page
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: CircleAvatar(
                      backgroundColor: _currentGuestImageIndex == index
                          ? Colors.brown
                          : Colors.grey[300],
                      radius: 30,
                      backgroundImage: AssetImage(_guestImagePaths[index]),
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
                          IconTextGuest(
                              icon: Icons.shower,
                              text: 'Shower',
                              color: Colors.black),
                          IconTextGuest(
                              icon: Icons.bed,
                              text: '1 Queen Size Bed',
                              color: Colors.black),
                          IconTextGuest(
                              icon: Icons.wifi,
                              text: 'Free WiFi',
                              color: Colors.black),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconTextGuest(
                              icon: Icons.tv, text: 'TV', color: Colors.black),
                          IconTextGuest(
                              icon: Icons.room_service,
                              text: '24/7 Service',
                              color: Colors.black),
                          IconTextGuest(
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
                  Text('After that, RS 421 Fee applies',
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
                    'RS 8105 3 nights',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  Text(
                    'RS 2742 1 night',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            // Removed the Book Now button section
          ],
        ),
      ),
    );
  }
}

class IconTextGuest extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;

  IconTextGuest({required this.icon, required this.text, required this.color});

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