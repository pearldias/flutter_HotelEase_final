import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore
import 'login.dart'; // Import LoginScreen
import 'dashboard.dart'; // Import DashboardPage
import 'editprofile.dart'; // Import EditProfileScreen
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  String _employeeName = '';
  String _employeeDesignation = '';
  String _employeeEmail = '';
  String _employeePhone = '';
  String _employeeAddress = '';
  bool _isEditing = false; // Toggle between edit and view mode
  bool _isLoading = true; // Show loading indicator

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(); // Initialize controllers
    _addressController = TextEditingController();
    _loadEmployeeData(); // Load employee data when the screen is initialized
  }

  // Fetch employee data from Firestore
  Future<void> _loadEmployeeData() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        throw Exception('User not logged in');
      }

      String userEmail = currentUser.email!;
      print("Trying to fetch document for email: $userEmail");

      DocumentSnapshot employeeDoc =
          await _firestore.collection('Employee').doc(userEmail).get();

      print("Document exists: ${employeeDoc.exists}");
      if (employeeDoc.exists) {
        setState(() {
          _employeeName =
              employeeDoc['empname'] ?? 'No name'; // Retrieve employee name
          _employeeDesignation = employeeDoc['designation'] ??
              'No designation'; // Retrieve designation
          _employeeEmail = employeeDoc['email'] ?? 'No email'; // Retrieve email
          _employeePhone = employeeDoc['phone'] ?? 'No phone'; // Retrieve phone
          _employeeAddress = employeeDoc['address'] ??
              'No address'; // Retrieve address (fixed typo)

          // Initialize controllers with values from Firestore
          _phoneController.text = _employeePhone; // Retrieve phone
          _addressController.text = _employeeAddress; // Retrieve address
          _isLoading = false; // Data loaded, stop showing loading indicator
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Employee data not found')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading data: ${e.toString()}')),
      );
    }
  }

  Future<void> _updateEmployeeData() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        // Prepare employee data to update
        Map<String, dynamic> updateData = {
          'email': _employeeEmail, // Keep the email
          'empname': _employeeName, // Keep the employee name
          'designation': _employeeDesignation, // Keep the designation
          'phone': _phoneController.text.isNotEmpty
              ? _phoneController.text
              : null, // Update phone
          'address': _addressController.text.isNotEmpty
              ? _addressController.text
              : null, // Update address
        };

        // Update Firestore document with employee data
        await _firestore
            .collection('Employee')
            .doc(currentUser.email)
            .set(updateData, SetOptions(merge: true));

        setState(() {
          _isEditing = false; // Exit edit mode after saving
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
      }
    } catch (e) {
      print("Error updating employee data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Show a loading indicator while data is being fetched
      return Scaffold(
        backgroundColor: const Color(0xFFEDE7E3), // Light brown background
        appBar: AppBar(
          backgroundColor: const Color(0xFF5D4037), // Dark brown AppBar
          title: const Text(
            'Profile',
            style: TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEDE7E3), // Light brown background
      appBar: AppBar(
        backgroundColor: const Color(0xFF5D4037), // Dark brown AppBar
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w600),
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
            child: Icon(Icons.person,
                size: 30, color: Colors.white), // Right side icon
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
                    backgroundColor:
                        Color(0xFF795548), // Light brown for icon background
                    child: Icon(
                      Icons.person,
                      size: 55,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _employeeName.isNotEmpty
                            ? _employeeName
                            : 'Loading...', // Display employee name
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _employeeDesignation.isNotEmpty
                            ? _employeeDesignation
                            : 'Loading...', // Display designation
                        style: const TextStyle(
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
                    value: _employeeEmail.isNotEmpty
                        ? _employeeEmail
                        : 'Loading...', // Display email
                    icon: Icons.email,
                    editable: false,
                  ),

                  // Phone Card
                  _buildInteractiveCard(
                    context,
                    label: 'Phone',
                    value: _employeePhone.isNotEmpty
                        ? _employeePhone
                        : 'Loading...', // Display phone
                    icon: Icons.phone,
                    editable: _isEditing,
                    controller: _phoneController,
                  ),

                  // Address Card
                  _buildInteractiveCard(
                    context,
                    label: 'Address',
                    value: _employeeAddress.isNotEmpty
                        ? _employeeAddress
                        : 'Loading...', // Display address
                    icon: Icons.location_on,
                    editable: _isEditing,
                    controller: _addressController,
                  ),

                  const SizedBox(height: 20),

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
                        _updateEmployeeData(); // Update data if in editing mode
                      } else {
                        setState(() {
                          _isEditing = true; // Switch to editing mode
                        });
                      }
                    },
                    child: Text(
                      _isEditing ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 18),
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

  Widget _buildInteractiveCard(
    BuildContext context, {
    required String label,
    required String value,
    required IconData icon,
    bool editable = false,
    TextEditingController? controller,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.brown),
        title: editable
            ? TextField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: label,
                  border: const OutlineInputBorder(),
                ),
              )
            : Text(
                '$label: $value',
                style: const TextStyle(fontSize: 18),
              ),
        trailing: editable
            ? IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () {
                  // Handle the save action here if needed
                },
              )
            : null,
      ),
    );
  }
}
