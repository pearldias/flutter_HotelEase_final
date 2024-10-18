import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  String _employeeName = 'John Doe';
  String _employeeDesignation = 'Software Engineer';
  String _employeeEmail = 'john.doe@example.com';
  String _employeePhone = '123-456-7890';
  String _employeeAddress = '123 Main St, Anytown, USA';
  bool _isEditing = false; // Toggle between edit and view mode

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController(text: _employeePhone); // Initialize controllers
    _addressController = TextEditingController(text: _employeeAddress);
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _updateEmployeeData() {
    setState(() {
      _employeePhone = _phoneController.text;
      _employeeAddress = _addressController.text;
      _isEditing = false; // Exit edit mode after saving
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile updated successfully')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF6D4C41),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color(0xFFEDE7E3), // Light brown background
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20), // Space at the top

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
                    children: [
                      Text(
                        _employeeName,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _employeeDesignation,
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
                    value: _employeeEmail,
                    icon: Icons.email,
                    editable: false,
                  ),

                  // Phone Card
                  _buildInteractiveCard(
                    context,
                    label: 'Phone',
                    value: _employeePhone,
                    icon: Icons.phone,
                    editable: _isEditing,
                    controller: _phoneController,
                  ),

                  // Address Card
                  _buildInteractiveCard(
                    context,
                    label: 'Address',
                    value: _employeeAddress,
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
                      style: const TextStyle(fontSize: 18, color: Colors.white), // Change text color to white
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