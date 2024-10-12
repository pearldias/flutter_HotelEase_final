import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginScreen
import 'dashboard.dart'; // Import DashboardPage
import 'editprofile.dart'; // Import EditProfileScreen

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDE7E3), // Light brown background
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D4037), // Dark brown AppBar
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate back to the DashboardPage without changing profile details
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
            );
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.person, size: 30, color: Colors.white), // Right side icon
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile header container
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF6D4C41), // Medium brown shade
                borderRadius: BorderRadius.circular(20), // Rounded corners
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4), // Slightly larger shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF795548), // Light brown for icon background
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Employee Name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Employee Designation',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(thickness: 1, indent: 16, endIndent: 16),

            // Contact Information section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[900],
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Email Card
                  _buildInteractiveCard(
                    context,
                    label: 'Email',
                    value: 'example@domain.com',
                    icon: Icons.email,
                  ),

                  // Phone Card
                  _buildInteractiveCard(
                    context,
                    label: 'Phone',
                    value: '1234567890',
                    icon: Icons.phone,
                  ),

                  // Address Card
                  _buildInteractiveCard(
                    context,
                    label: 'Address',
                    value: '123, Sample Street, City',
                    icon: Icons.location_on,
                  ),

                  const SizedBox(height: 20),

                  // Edit Profile button with gradient
                  _buildButton(
                    label: 'Edit Profile Details',
                    onPressed: () {
                      // Navigate to EditProfileScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                      );
                    },
                    gradient: const LinearGradient(
                      colors: [Color(0xFF795548), Color(0xFF6D4C41)], // Gradient shades of brown
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Log Out button with darker gradient
                  _buildButton(
                    label: 'Log Out',
                    onPressed: () {
                      // Navigate to LoginScreen upon logout
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    gradient: const LinearGradient(
                      colors: [Color(0xFF5D4037), Color(0xFF4E342E)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
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

  // Method for building interactive card for information fields
  Widget _buildInteractiveCard(BuildContext context, {required String label, required String value, required IconData icon}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {
          // Add functionality for editing information
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, color: Colors.brown[800], size: 28), // Larger icon
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.brown[900],
                    ),
                  ),
                ],
              ),
              Text(
                value,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method for building custom buttons with gradient and elevated design
  Widget _buildButton({required String label, required void Function()? onPressed, required Gradient gradient}) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}