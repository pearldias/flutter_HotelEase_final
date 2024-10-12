import 'package:flutter/material.dart';
import 'profilesetting.dart'; // Import ProfileScreen

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFD7CCC8), // Darker beige background
        appBar: AppBar(
          backgroundColor: const Color(0xFF6D4C41), // Medium-dark brown
          title: const Text(
            'Edit Profile',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              // Navigate back to ProfileScreen
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Profile avatar with gradient ring
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF8D6E63), Color(0xFF5D4037)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  padding: const EdgeInsets.all(3),
                  child: const CircleAvatar(
                    radius: 60,
                    backgroundColor: Color(0xFF8D6E63), // Darker brown
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Text fields with icons
                _buildTextField(
                  controller: _nameController,
                  label: 'Name',
                  hintText: 'Enter your name',
                  icon: Icons.person,
                ),
                _buildTextField(
                  controller: _emailController,
                  label: 'Email',
                  hintText: 'Enter your email',
                  icon: Icons.email,
                ),
                _buildTextField(
                  controller: _phoneController,
                  label: 'Phone',
                  hintText: 'Enter your phone number',
                  icon: Icons.phone_android,
                ),
                _buildTextField(
                  controller: _addressController,
                  label: 'Address',
                  hintText: 'Enter your address',
                  icon: Icons.location_on,
                ),

                const SizedBox(height: 30),

                // Save button with reduced size and no icon
                _buildButton(
                  label: 'Save Profile',
                  onPressed: () {
                    // Save profile functionality
                    // Navigate back to ProfileScreen
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfileScreen()),
                    );
                  },
                  gradient: const LinearGradient(
                    colors: [Color(0xFF8D6E63), Color(0xFF5D4037)], // Medium to dark brown gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to build a customized text field
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFA1887F), // Darker brown background
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white, fontSize: 16), // White text for contrast
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: label,
          labelStyle: const TextStyle(color: Colors.white70, fontSize: 16),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white60),
          prefixIcon: Icon(icon, color: Colors.white70), // White icons for uniformity
        ),
      ),
    );
  }

  // Method for building custom buttons with gradient and elevated design
  Widget _buildButton({
    required String label,
    required void Function()? onPressed,
    required Gradient gradient,
  }) {
    return Container(
      width: double.infinity,
      height: 50, // Smaller height for a more compact button
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(15), // Curved edges
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14.0), // Slightly padded
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Curved edges for rectangle
          ),
          backgroundColor: Colors.transparent,
          elevation: 0, // Remove button-specific shadow
        ),
      ),
    );
  }
}