import 'package:flutter/material.dart';

class FoodMenu extends StatefulWidget {
  const FoodMenu({super.key});

  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  // Updated list of dishes from real-world hotel menus
  final Map<String, List<String>> menuItems = {
    'APPETIZERS': [
      'Shrimp Cocktail ₹189',
      'Wagyu Beef Sliders ₹209',
      'Oysters Rockefeller ₹299',
      'Truffle Fries ₹399',
      'Tuna Tartare ₹999',
    ],
    'SOUPS & SALADS': [
      'French Onion Soup ₹399',
      'Heirloom Tomato Salad ₹499',
      'Roasted Beet Salad ₹599',
      'Caesar Salad ₹599',
      'Lobster Bisque ₹799',
    ],
    'MAIN COURSE': [
      'Lobster Ravioli ₹329',
      'Duck Breast with Cherry Glaze ₹499',
      'Dry-Aged Ribeye Steak ₹599',
      'Seared Sea Bass ₹799',
      'Herb-Crusted Rack of Lamb ₹999',
    ],
    'DESSERTS': [
      'New York Cheesecake ₹1199',
      'Molten Lava Cake ₹1399',
      'Tiramisu ₹1299',
      'Crème Brûlée ₹1499',
      'Macarons ₹999',
    ],
    'DRINKS': [
      'Espresso ₹399',
      'Iced Coffee ₹499',
      'Sparkling Water ₹499',
      'Manhattan Cocktail ₹799',
      'Classic Martini ₹899',
    ],
  };

  // Map of descriptions for each food item
  final Map<String, String> itemDescriptions = {
    'Shrimp Cocktail': 'Fresh shrimp served with a tangy cocktail sauce and lemon.',
    'Wagyu Beef Sliders': 'Juicy wagyu beef sliders topped with cheddar cheese and pickles.',
    'Oysters Rockefeller': 'Baked oysters topped with a rich butter, herbs, and breadcrumbs.',
    'Truffle Fries': 'Crispy fries drizzled with truffle oil and sprinkled with parmesan.',
    'Tuna Tartare': 'Fresh tuna tartare served with avocado and sesame soy dressing.',
    'French Onion Soup': 'Classic soup topped with melted cheese and crispy croutons.',
    'Heirloom Tomato Salad': 'Fresh heirloom tomatoes with basil, mozzarella, and balsamic.',
    'Roasted Beet Salad': 'Roasted beets with goat cheese, walnuts, and mixed greens.',
    'Caesar Salad': 'Romaine lettuce with Caesar dressing, croutons, and parmesan.',
    'Lobster Bisque': 'Creamy lobster bisque with a touch of sherry.',
    'Lobster Ravioli': 'Homemade ravioli stuffed with lobster served in a creamy sauce.',
    'Duck Breast with Cherry Glaze': 'Pan-seared duck breast with a sweet cherry glaze.',
    'Dry-Aged Ribeye Steak': 'Flavorful dry-aged ribeye steak cooked to perfection.',
    'Seared Sea Bass': 'Perfectly seared sea bass with a lemon butter sauce.',
    'Herb-Crusted Rack of Lamb': 'Rack of lamb crusted with herbs and served with mint sauce.',
    'New York Cheesecake': 'Classic New York cheesecake with a buttery graham cracker crust.',
    'Molten Lava Cake': 'Chocolate cake with a gooey molten center, served with ice cream.',
    'Tiramisu': 'Coffee-flavored dessert with layers of mascarpone and cocoa.',
    'Crème Brûlée': 'Rich custard topped with a caramelized sugar crust.',
    'Macarons': 'Delicate French pastries filled with various flavors.',
    'Espresso': 'Strong and bold espresso coffee.',
    'Iced Coffee': 'Chilled coffee served with ice and milk.',
    'Sparkling Water': 'Refreshing sparkling mineral water.',
    'Manhattan Cocktail': 'Classic cocktail made with whiskey, sweet vermouth, and bitters.',
    'Classic Martini': 'A timeless cocktail made with gin and dry vermouth.',
  };

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/menubg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // AppBar with Back button
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
          ),
          // Menu content
          Center(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              padding: const EdgeInsets.all(16.0),
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Menu...',
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: const Icon(Icons.search, color: Colors.brown),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query.toLowerCase();
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: _buildFilteredMenu(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Done button at the bottom
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFilteredMenu() {
    List<Widget> menuSections = [];

    menuItems.forEach((section, items) {
      // Filter items based on search query
      final filteredItems = items.where((item) {
        final itemName = item.split(' ₹')[0].toLowerCase();
        return itemName.contains(searchQuery);
      }).toList();

      if (filteredItems.isNotEmpty) {
        menuSections.add(Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(_getSectionIcon(section), color: Colors.brown, size: 28),
                const SizedBox(width: 10),
                Text(
                  section,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            for (var item in filteredItems)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          // Show item details dialog
                          String itemName = item.split(' ₹')[0]; // Get food name
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(itemName),
                                content: Text(itemDescriptions[itemName] ?? 'Description not available.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Text(
                          item.split(' ₹')[0], // Food name
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '₹${item.split(' ₹')[1]}', // Price
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ));
        menuSections.add(const Divider());
      }
    });

    if (menuSections.isEmpty) {
      return [
        const Center(
          child: Text(
            'No results found.',
            style: TextStyle(fontSize: 18, color: Colors.brown),
          ),
        ),
      ];
    }

    return menuSections;
  }

  IconData _getSectionIcon(String section) {
    switch (section) {
      case 'APPETIZERS':
        return Icons.local_pizza;
      case 'SOUPS & SALADS':
        return Icons.soup_kitchen;
      case 'MAIN COURSE':
        return Icons.dinner_dining;
      case 'DESSERTS':
        return Icons.cake;
      case 'DRINKS':
        return Icons.local_bar;
      default:
        return Icons.help;
    }
  }
}