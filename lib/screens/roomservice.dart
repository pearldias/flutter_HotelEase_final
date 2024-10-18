import 'package:flutter/material.dart';
import 'contact.dart'; // Import the ContactPage

class RoomService extends StatefulWidget {
  const RoomService({super.key});

  @override
  _RoomServiceState createState() => _RoomServiceState();
}

class _RoomServiceState extends State<RoomService> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _services = [];
  List<Map<String, String>> _filteredServices = [];

  @override
  void initState() {
    super.initState();
    // List of all services with their details
    _services = [
      {
        'imagePath': 'assets/rs2.jpg',
        'description': 'Savor Every Moment, Delivered to Your Door!',
        'serviceName': 'Meals & Beverages',
        'route': '/foodMenu',
      },
      {
        'imagePath': 'assets/rs1.jpg',
        'description': 'Your Comfort, Our Priority – Always Pristine.',
        'serviceName': 'Housekeeping',
        'route': '/housekeeping',
      },
      {
        'imagePath': 'assets/rs3.jpg',
        'description': 'Swift Solutions for a Seamless Stay.',
        'serviceName': 'Maintenance',
        'route': '/maintenance',
      },
    ];
    _filteredServices = List.from(_services);
  }

  // Function to filter services based on search input
  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredServices = List.from(_services);
      } else {
        _filteredServices = _services
            .where((service) => service['serviceName']!
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Decrease the white border at the top by 1cm (now 30 pixels)
              const SizedBox(height: 30), // Adjusted height for reduced white space
              Row(
                children: [
                  // Back Arrow Button
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.brown),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 10), // Spacing between back arrow and search bar
                  // Search Bar
                  Expanded(child: _buildSearchBar()),
                ],
              ),
              const SizedBox(height: 20),
              // Service Tiles - filtered list
              if (_filteredServices.isNotEmpty)
                ..._filteredServices.map((service) {
                  return Column(
                    children: [
                      _buildServiceTile(
                        context,
                        service['imagePath']!,
                        service['description']!,
                        service['serviceName']!,
                        () {
                          Navigator.pushNamed(context, service['route']!);
                        },
                        // Navigate to ContactPage when 'Call Now' is clicked
                        () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ContactPage()),
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList()
              else
                const Text(
                  'No services found.',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.brown,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) => _filterServices(value),
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: Colors.brown),
        hintText: 'Search services...',
        filled: true,
        fillColor: Colors.brown[50],
        contentPadding: const EdgeInsets.all(16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildServiceTile(BuildContext context, String imagePath,
      String description, String serviceName, VoidCallback onTap, VoidCallback onCallNow) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shadowColor: Colors.brown.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
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
            // Description, Service Name, and Call Now Button in Row
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Service Name and Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          serviceName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown[900],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.brown[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10), // Space between text and button
                  // Call Now Button in a Soft Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.brown[50], // Light brown background
                      borderRadius:
                          BorderRadius.circular(12), // Soft rounded corners
                      border: Border.all(
                        color: Colors.brown[300]!, // Subtle border color
                        width: 1,
                      ),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: TextButton.icon(
                      onPressed: onCallNow, // Handle call action by navigating to ContactPage
                      icon: const Icon(Icons.phone, color: Colors.brown),
                      label: const Text('Call Now'),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.brown[900], // Brown text color
                      ),
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