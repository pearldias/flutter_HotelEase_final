import 'package:flutter/material.dart';
import 'booking.dart'; // Import the BookingPage

class GuestDoubleStandardRoomDetailPage extends StatefulWidget {
  const GuestDoubleStandardRoomDetailPage({super.key});

  @override
  _GuestDoubleStandardRoomDetailPageState createState() => _GuestDoubleStandardRoomDetailPageState();
}

class _GuestDoubleStandardRoomDetailPageState extends State<GuestDoubleStandardRoomDetailPage> {
  int _currentImageIndex = 0; // Track the current image index
  final List<String> _imagePaths = [
    'assets/ds3.jpg',
    'assets/ds2.jpg',
    'assets/ds1.jpg',
  ];
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
                    controller: _pageController,
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
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
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
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    color: Colors.black.withOpacity(0.5),
                    child: const Center(
                      child: Text(
                        'Double Standard Room',
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
            const SizedBox(height: 16),
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
                      duration: const Duration(milliseconds: 300),
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
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Room Amenities',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          IconText(
                              icon: Icons.shower,
                              text: 'Shower',
                              color: Colors.black),
                          IconText(
                              icon: Icons.bed,
                              text: '2 Queen Size Beds',
                              color: Colors.black),
                          IconText(
                              icon: Icons.wifi,
                              text: 'Free WiFi',
                              color: Colors.black),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          IconText(
                              icon: Icons.ac_unit,
                              text: 'Air Conditioning',
                              color: Colors.black),
                          IconText(
                              icon: Icons.room_service,
                              text: '24/7 Room Service',
                              color: Colors.black),
                          IconText(
                              icon: Icons.breakfast_dining,
                              text: 'Complimentary Breakfast',
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cancellation Rules',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text('Free Cancellation until 1 week before check-in',
                      style: TextStyle(color: Colors.black)),
                  const Text('After that, a fee of RS 500 applies',
                      style: TextStyle(color: Colors.black)),
                  const Text(
                      'No refunds if canceled 48 hours before check-in',
                      style: TextStyle(color: Colors.black)),
                  const SizedBox(height: 16),
                  const Text(
                    'Price:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Showing prices in plain text
                  const Text(
                    'RS 11,035 for 3 nights',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Text(
                    'RS 4,000 for 1 night',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            // Removed the Book Now button
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

  const IconText({super.key, required this.icon, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 8),
        Text(text, style: TextStyle(color: color)),
      ],
    );
  }
}