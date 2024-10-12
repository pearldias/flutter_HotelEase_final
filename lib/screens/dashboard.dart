import 'package:flutter/material.dart';
import 'profilesetting.dart'; // Import ProfileScreen
import 'empfeedback.dart'; // Import EmployeeFeedbackPage
import 'notification.dart'; // Import NotificationPage for Shifts

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Keep original background image with dark overlay
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/ebg.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), // Slightly less dark overlay
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header with logo and app name (Removed the back button)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF4E342E), // Dark brown
                      Color(0xFF3E2723), // Slightly darker brown
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15), // Rounded top and bottom
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8,
                      offset: Offset(0, 4), // Subtle shadow for depth
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Logo and app name (Back button removed)
                    CircleAvatar(
                      radius: 20, // Compact avatar
                      backgroundImage: AssetImage('assets/logo.jpg'),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'HotelEase',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20), // Reduced spacing
              // Centered menu section with cards
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xCC6D4C41),
                      borderRadius: BorderRadius.circular(15), // Softer rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4), // Subtle shadow for depth
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min, // Adjust to content height
                      children: [
                        buildMenuButton('assets/pss.jpg', 'Profile Settings', context, () {
                          // Navigate to ProfileScreen
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ProfileScreen()),
                          );
                        }),
                        Divider(color: Colors.white.withOpacity(0.5)), // Subtle divider
                        buildMenuButton('assets/shifts.png', 'Shifts', context, () {
                          // Navigate to NotificationPage (for Shifts)
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NotificationPage()),
                          );
                        }),
                        Divider(color: Colors.white.withOpacity(0.5)), // Divider
                        buildMenuButton('assets/f.png', 'Employee Feedback', context, () {
                          // Navigate to EmployeeFeedbackPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => EmployeeFeedbackPage()),
                          );
                        }),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30), // Space at the bottom for balance
            ],
          ),
        ],
      ),
    );
  }

  // Function to build menu buttons with card design
  Widget buildMenuButton(String imagePath, String label, BuildContext context, Function onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10), // More compact
      child: InkWell(
        borderRadius: BorderRadius.circular(10), // Hover effect
        splashColor: Colors.white.withOpacity(0.2),
        onTap: () => onTap(),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Softer button edges
          ),
          color: Color(0xFF4E342E), // Consistent dark brown
          child: Padding(
            padding: EdgeInsets.all(16), // Good internal spacing
            child: Row(
              children: [
                // Circular image for button
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(imagePath),
                ),
                SizedBox(width: 15),
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}