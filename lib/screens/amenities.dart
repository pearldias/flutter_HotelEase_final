import 'package:flutter/material.dart';

class AmenitiesPage extends StatefulWidget {
  @override
  _AmenitiesPageState createState() => _AmenitiesPageState();
}

class _AmenitiesPageState extends State<AmenitiesPage> {
  List<Map<String, String>> amenities = [
    {"image": "assets/spa.jpg", "name": "Spa", "description": "Relax and unwind in our luxurious spa with a variety of treatments."},
    {"image": "assets/hk.png", "name": "Housekeeping", "description": "Our housekeeping team ensures your room is spotless every day."},
    {"image": "assets/gym1.jpg", "name": "Gym", "description": "Stay fit and healthy in our well-equipped gym."},
    {"image": "assets/sp.jpg", "name": "Swimming Pool", "description": "Take a refreshing dip in our beautiful swimming pool."},
    {"image": "assets/cp.jpg", "name": "Car Parking", "description": "We offer secure car parking facilities for our guests."},
    {"image": "assets/pet.jpg", "name": "Pet-friendly", "description": "Bring your pets along, we have dedicated facilities for them."},
    {"image": "assets/meetings.jpg", "name": "Meetings", "description": "Host your meetings in our well-appointed conference rooms."},
    {"image": "assets/car.jpg", "name": "Luxury Transport", "description": "Enjoy luxury transport services during your stay."},
    {"image": "assets/bar.jpg", "name": "Restaurant & Bar", "description": "Savor exquisite dining and drinks at our restaurant and bar."},
    {"image": "assets/airport.jpg", "name": "Airport Shuttle", "description": "Convenient airport shuttle services for our guests."},
  ];
  
  String _searchText = '';

  void _showAmenityDetails(String name, String description) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.brown[50],
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown[800]),
              ),
              SizedBox(height: 16),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close", style: TextStyle(color: Colors.black)), // Text color set to black
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[600], // Background color set to brown
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> filteredAmenities = amenities.where((amenity) {
      return amenity["name"]!.toLowerCase().contains(_searchText.toLowerCase());
    }).toList();

    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        backgroundColor: Colors.brown,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
              decoration: InputDecoration(
                hintText: "Search amenities...",
                prefixIcon: Icon(Icons.search, color: Colors.brown),
                filled: true,
                fillColor: Colors.brown[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.75, // Control the aspect ratio of each grid item
              ),
              itemCount: filteredAmenities.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showAmenityDetails(
                      filteredAmenities[index]["name"]!,
                      filteredAmenities[index]["description"]!,
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: Image.asset(
                              filteredAmenities[index]["image"]!,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            color: Colors.brown,
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              filteredAmenities[index]["name"]!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}