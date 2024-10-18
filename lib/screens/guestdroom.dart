import 'package:flutter/material.dart';

class GuestDeluxeRoomDetailPage extends StatefulWidget {
  const GuestDeluxeRoomDetailPage({super.key});

  @override
  _GuestDeluxeRoomDetailPageState createState() => _GuestDeluxeRoomDetailPageState();
}

class _GuestDeluxeRoomDetailPageState extends State<GuestDeluxeRoomDetailPage> {
  int _currentImageIndex = 0; // Track the current image index
  final List<String> _imagePaths = [
    'assets/d1.jpg',
    'assets/d2.jpg',
    'assets/d3.jpg',
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
                        'Deluxe Room',
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
            const SizedBox(height: 8),
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
            // Image navigation dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_imagePaths.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: _currentImageIndex == index ? Colors.brown : Colors.grey,
                    shape: BoxShape.circle,
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
                    'Room Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Our Deluxe Room offers the finest comfort with modern furnishings, a king-size bed, and stunning views.',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const SizedBox(height: 16),
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
                              text: 'Jacuzzi',
                              color: Colors.black),
                          IconText(
                              icon: Icons.bed,
                              text: 'King Size Bed',
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
                              icon: Icons.tv,
                              text: '42-inch TV',
                              color: Colors.black),
                          IconText(
                              icon: Icons.room_service,
                              text: '24/7 Room Service',
                              color: Colors.black),
                          IconText(
                              icon: Icons.ac_unit,
                              text: 'Air Conditioning',
                              color: Colors.black),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Rating:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star, color: Colors.amber, size: 30),
                      Icon(Icons.star_half, color: Colors.amber, size: 30),
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
                  const Text('Free Cancellation until 3 days before check-in',
                      style: TextStyle(color: Colors.black)),
                  const Text('After that, RS 700 cancellation fee applies',
                      style: TextStyle(color: Colors.black)),
                  const Text(
                      'No refunds if canceled 24 hours before check-in',
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
                    'RS 17,050 for 3 nights',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  const Text(
                    'RS 6,000 for 1 night',
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Adding a gap at the bottom
            Container(
              height: 1, // Height of the gap
              color: Colors.white, // Color of the gap
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