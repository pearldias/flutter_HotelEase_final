import 'package:flutter/material.dart';
class EditcustProfileScreen extends StatefulWidget {
  const EditcustProfileScreen({super.key});
  @override
  _EditcustProfileScreenState createState() => _EditcustProfileScreenState();
}
class _EditcustProfileScreenState extends State<EditcustProfileScreen> {
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
        backgroundColor: const Color(0xFFF5F5DC), // Light beige background
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
              Navigator.pop(context); // Navigate back to UserProfile screen
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
                    // For now, just go back to the user profile
                    Navigator.pop(context); // Navigate back to UserProfile screen
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
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hintText,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(icon, color: const Color(0xFF6D4C41)), // Medium-dark brown
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
        ),
      ),
    );
  }
  Widget _buildButton({
    required String label,
    required VoidCallback onPressed,
    required LinearGradient gradient,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        gradient: gradient,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          backgroundColor: Colors.transparent, // Transparent to show gradient
          shadowColor: Colors.transparent, // No shadow for flat button
        ),
        onPressed: onPressed,
        child: Text(label, style: const TextStyle(fontSize: 18, color: Colors.white)), // Set text color to white
      ),
    );
  }
}