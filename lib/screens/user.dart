import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late TextEditingController _phoneController;
  late TextEditingController _addressController;
  String email = '';
  String username = '';
  bool _isEditing = false; // Toggle between edit and view mode
  bool _isLoading = true; // Show loading indicator

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(); // Initialize controllers
    _addressController = TextEditingController();
    _fetchUserData(); // Fetch user data when the widget is initialized
  }

  Future<void> _fetchUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Fetch user data from Firestore using email as the document ID
        DocumentSnapshot userData =
            await _firestore.collection('Users').doc(user.email).get();
        if (userData.exists) {
          setState(() {
            email = userData['email'];
            username = userData['username'];

            // Initialize controllers with values from Firestore
            _phoneController.text = userData['phone'] ?? ''; // Retrieve phone
            _addressController.text =
                userData['address'] ?? ''; // Retrieve address
            _isLoading = false; // Data loaded, stop showing loading indicator
          });
        }
      }
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> _updateUserData() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        // Prepare user data to update
        Map<String, dynamic> updateData = {
          'email': email, // Keep the email
          'username': username, // Keep the username
        };

        // Only add phone and address if they have values
        if (_phoneController.text.isNotEmpty) {
          updateData['phone'] = _phoneController.text;
        }
        if (_addressController.text.isNotEmpty) {
          updateData['address'] = _addressController.text;
        }

        // Update Firestore document with user data
        await _firestore
            .collection('Users')
            .doc(user.email)
            .set(updateData, SetOptions(merge: true));

        setState(() {
          _isEditing = false; // Exit edit mode after saving
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } catch (e) {
      print("Error updating user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show a loading indicator while data is being fetched
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8C6239),
          title: const Text('Profile'),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8C6239), // Brown color for the app bar
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                'assets/logo.jpg',
                height: 50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'HotelEase',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile picture
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/userbrown.jpg'),
              ),
              const SizedBox(height: 16),
              // Username
              Text(
                username,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              // Contact Information
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Contact Information',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Email (non-editable)
              _buildInfoRow('Email', email, editable: false),
              const SizedBox(height: 8),
              // Phone (editable)
              _buildInfoRow(
                'Phone',
                _phoneController.text,
                editable: _isEditing,
                controller: _phoneController,
              ),
              const SizedBox(height: 8),
              // Address (editable)
              _buildInfoRow(
                'Address',
                _addressController.text,
                editable: _isEditing,
                controller: _addressController,
              ),
              const SizedBox(height: 16),
              // Toggle Edit/Save button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  if (_isEditing) {
                    // Save changes
                    _updateUserData();
                  } else {
                    // Enter edit mode
                    setState(() {
                      _isEditing = true;
                    });
                  }
                },
                child: Text(
                  _isEditing ? 'Save Changes' : 'Edit Profile',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              // Log out button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD3A47D),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.brown),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget to build each row of contact information
  Widget _buildInfoRow(String label, String value,
      {bool editable = false, TextEditingController? controller}) {
    return Container(
      padding: const EdgeInsets.all(12),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      color: const Color(0xFFD3A47D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          editable
              ? TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    hintText: 'Enter new value',
                    border: InputBorder.none,
                  ),
                )
              : Text(
                  value.isNotEmpty ? value : 'N/A'), // Show 'N/A' if no value
        ],
      ),
    );
  }
}
