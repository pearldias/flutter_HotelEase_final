import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100, // Beige/light brown background
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top image section with search bar
            Stack(
              children: [
                // Background image for top section
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg_customer.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Search bar
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to MenuScreen when tapping on "Find Your Perfect Stay"
                      Navigator.pushNamed(context, '/menu');
                    },
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
                        children: const [
                          Icon(Icons.search, color: Colors.brown),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Find Your Perfect Stay...',
                                border: InputBorder.none,
                              ),
                              enabled: false, // Disable text input, as it's just for navigation
                            ),
                          ),
                          Icon(Icons.person, color: Colors.brown),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Room, Booking & Payment, Service, Feedback options
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _buildCategoryCard('ROOMS', 'assets/room.jpg', () {
                    // Navigate to RoomsPage on tapping "ROOMS"
                    Navigator.pushNamed(context, '/rooms');
                  }),
                  _buildCategoryCard('BOOKING & PAYMENT', 'assets/booking_payment.jpg', () {
                    // Navigate to BookingForm on tapping "BOOKING & PAYMENT"
                    Navigator.pushNamed(context, '/bookingAndPayment');
                  }),
                  _buildCategoryCard('SERVICE', 'assets/service.jpg', () {
                    // Navigate to RoomService on tapping "SERVICE"
                    Navigator.pushNamed(context, '/roomService'); // Change made here
                  }),
                  _buildCategoryCard('FEEDBACK', 'assets/feedback.jpg', () {
                    // Navigate to FeedbackScreen on tapping "FEEDBACK"
                    Navigator.pushNamed(context, '/feedback');
                  }),
                ],
              ),
            ),
            // User review section with background image
            Stack(
              alignment: Alignment.center,
              children: [
                // Background image (user_bg) for review section
                Container(
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/user_bg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Square-shaped review card positioned in the bottom-right
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 200, // Square size: width = height = 200
                    height: 200,
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Star rating (assuming 5 stars)
                            Row(
                              children: List.generate(5, (index) {
                                return Icon(
                                  Icons.star,
                                  color: index < 4 ? Colors.orange : Colors.grey, // 4 filled stars
                                  size: 16,
                                );
                              }),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Review title
                        const Text(
                          'Perfect Stay!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        // Review text
                        const Text(
                          'Clean rooms, Great Service! ...',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Reviewer details (profile image and name)
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage('assets/user.jpg'),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Amy Dave',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  '24-08-24',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  // Helper widget to build each category card
  Widget _buildCategoryCard(String title, String imagePath, void Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.brown.shade100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              // Full background image for the square
              Positioned.fill(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
              // Title text overlay
              Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Container(
                  color: Colors.black54,
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}