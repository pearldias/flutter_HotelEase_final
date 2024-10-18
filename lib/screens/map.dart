import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelAddPage extends StatelessWidget {
  final String hotelSlogan = 'Experience Luxury Like Never Before';
  final String hotelAddress = 'Club Mahindra Resort, Assonora, Goa';
  final String fullAddress =
      'Survey No 16/0 & 7/0, Assonora Resorts, near Water treatment plant, Goa 403503';
  // Provided Google Maps URL
  final String googleMapsUrl =
      'https://www.google.com/maps/place/Club+Mahindra+Resort-+Assonora,+Goa/@15.6300974,73.9063843,15z/data=!4m9!3m8!1s0x3bbf95a10951e01d:0x14b6e197e0af3410!5m2!4m1!1i2!8m2!3d15.6300974!4d73.9063843!16s%2Fg%2F11qsmdvypg?entry=ttu&g_ep=EgoyMDI0MTAxNi4wIKXMDSoASAFQAw%3D%3D';
  final String phone = 'tel:+919322689394'; // Phone number to call the hotel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        hotelSlogan,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        hotelAddress,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.brown[700],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            // Full Address Card with Google Maps link
            Card(
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(Icons.location_on, color: Colors.brown),
                  title: Text(
                    fullAddress,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: GestureDetector(
                    onTap: () async {
                      if (await canLaunch(googleMapsUrl)) {
                        await launch(googleMapsUrl);
                      } else {
                        throw 'Could not open the map.';
                      }
                    },
                    child: Text(
                      'View on Google Maps',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            // Image carousel
            Container(
              height: 180,
              child: PageView(
                children: [
                  Image.asset('assets/add.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m1.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m2.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m3.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m4.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m5.jpg', fit: BoxFit.cover),
                  Image.asset('assets/m6.jpg', fit: BoxFit.cover),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Expanded Features: Dining Options
            _buildSection(
              title: 'Dining Options',
              content:
                  'Our resort offers gourmet dining experiences from Goan delicacies to international cuisines. Visit our restaurant or grab a snack at the café.',
            ),
            SizedBox(height: 20),
            // Guest Reviews Section
            _buildSection(
              title: 'Guest Reviews',
              content:
                  '“An unforgettable experience! The service was impeccable and the location was perfect for a relaxing getaway.” - John D.',
            ),
            SizedBox(height: 20),
            // Activities & Events Section
            _buildSection(
              title: 'Activities & Events',
              content:
                  'Join our weekly beach yoga, movie nights under the stars, or take a sunset cruise. Don’t miss out on the guided nature trails and water sports.',
            ),
            SizedBox(height: 20),
            // Amenities Section
            Divider(),
            Wrap(
              spacing: 20,
              runSpacing: 10,
              children: [
                _buildAmenityIcon(Icons.pool, 'Swimming Pool'),
                _buildAmenityIcon(Icons.spa, 'Spa'),
                _buildAmenityIcon(Icons.restaurant, 'Restaurant'),
                _buildAmenityIcon(Icons.local_parking, 'Free Parking'),
                _buildAmenityIcon(Icons.wifi, 'Free Wi-Fi'),
                _buildAmenityIcon(Icons.fitness_center, 'Fitness Center'),
                _buildAmenityIcon(Icons.airport_shuttle, 'Airport Shuttle'),
                _buildAmenityIcon(Icons.sports_tennis, 'Tennis Court'),
                _buildAmenityIcon(Icons.golf_course, 'Golf Course'),
              ],
            ),
            SizedBox(height: 20),
            // Contact Us Button
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                if (await canLaunch(phone)) {
                  await launch(phone);
                } else {
                  throw 'Could not make the call.';
                }
              },
              icon: Icon(Icons.call, color: Colors.white), // Changed icon color
              label: Text(
                'Contact Us',
                style: TextStyle(fontSize: 18, color: Colors.white), // Changed text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAmenityIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 30, color: Colors.brown),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 14)),
      ],
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.brown,
          ),
        ),
        SizedBox(height: 10),
        Text(
          content,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}