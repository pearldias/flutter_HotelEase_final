import 'package:flutter/material.dart';

class RoomService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Room Service',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // First service - Meal & Beverage
              _buildServiceTile(
                context,
                'assets/rs2.jpg',
                'Savor Every Moment, Delivered to Your Door!',
                'Meals & Beverages',
                () {
                  // Navigate to FoodMenu screen
                  Navigator.pushNamed(context, '/foodMenu');
                },
              ),

              SizedBox(height: 20),

              // Second service - Housekeeping
              _buildServiceTile(
                context,
                'assets/rs1.jpg',
                'Your Comfort, Our Priority – Always Pristine.',
                'Housekeeping',
                () {
                  // Define action when "Housekeeping" is tapped
                },
              ),

              SizedBox(height: 20),

              // Third service - Maintenance
              _buildServiceTile(
                context,
                'assets/rs3.jpg',
                'Swift Solutions for a Seamless Stay.',
                'Maintenance',
                () {
                  // Define action when "Maintenance" is tapped
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceTile(BuildContext context, String imagePath,
      String description, String serviceName, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap, // Add onTap to handle navigation
      child: Card(
        elevation: 5,
        shadowColor: Colors.brown.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),

            // Description and Important Text with Call Now Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service Name (bold, underlined)
                  Text(
                    serviceName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      color: Colors.brown[900],
                    ),
                  ),
                  SizedBox(height: 5),
                  // Service Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.brown[600],
                    ),
                  ),
                  SizedBox(height: 10),

                  // Brown container for important text and button
                  Container(
                    padding: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Colors.brown,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Important: Call for immediate service!',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle call action
                          },
                          icon: Icon(Icons.phone, color: Colors.white),
                          label: Text('Call Now'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Colors.brown[800], // Set to a darker brown
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}