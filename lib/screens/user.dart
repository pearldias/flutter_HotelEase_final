import 'package:flutter/material.dart';
class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8C6239), // Brown color for the app bar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center align logo and text
          children: [
            ClipOval( // Make the logo a little curved
              child: Image.asset(
                'assets/logo.jpg', // Your logo image
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 8),
            Text(
              'HotelEase',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24, // Increase font size
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Profile picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.jpg'), // Replace with your image asset
            ),
            SizedBox(height: 16),
            // User name
            Text(
              'Jada Jones',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            // Contact information section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Contact Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[700], // Contact information heading color
                ),
              ),
            ),
            SizedBox(height: 8),
            // Email
            Container(
              padding: EdgeInsets.all(12),
              width: double.infinity, // Make the container occupy full width
              margin: EdgeInsets.symmetric(horizontal: 5.0), // Margin to provide 0.5cm space on both sides
              color: Color(0xFFD3A47D), // Background for contact details
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('johnsmith@hotelease.co.in'),
                  SizedBox(height: 8),
                  Text(
                    'Phone:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('+1 234 567 890'),
                  SizedBox(height: 8),
                  Text(
                    'Address:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('1234 Elm Street, Springfield, Il.'),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Buttons for membership details, bookings, etc.
            Expanded(
              child: Column(
                children: [
                  buildProfileButton(
                    'Membership details', 
                    color: Colors.brown, 
                    onPressed: () {
                      // Placeholder function for membership details
                      print('Membership details clicked');
                    }
                  ), 
                  buildProfileButton(
                    'View Past Bookings', 
                    color: Colors.brown, 
                    onPressed: () {
                      // Placeholder function for viewing past bookings
                      print('View Past Bookings clicked');
                    }
                  ), 
                  buildProfileButton(
                    'Edit Profile', 
                    color: Colors.brown, 
                    onPressed: () {
                      // Placeholder function for editing profile
                      print('Edit Profile clicked');
                    }
                  ), 
                  buildProfileButton(
                    'Change Password', 
                    color: Colors.brown, 
                    onPressed: () {
                      // Placeholder function for changing password
                      print('Change Password clicked');
                    }
                  ), 
                  Spacer(),
                  // Log out button with dark brown text
                  buildProfileButton(
                    'Log Out', 
                    color: Color(0xFFD3A47D), 
                    textColor: Colors.brown, 
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login'); // Navigate to login screen
                    }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildProfileButton(String title, {Color color = const Color.fromARGB(255, 82, 58, 49), Color textColor = const Color.fromARGB(255, 242, 169, 146), required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed, // Assign the passed onPressed function
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: color,
            textStyle: TextStyle(fontSize: 16), // Use default text style
          ),
          child: Text(title, style: TextStyle(color: textColor)), // Use the specified text color
        ),
      ),
    );
  }
}