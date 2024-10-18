import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with subtle gradient
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Color(0xFFD2B48C),
                  Color(0xFFEDE3D2),
                ],
                center: Alignment(-0.8, -0.8),
                radius: 1.6,
              ),
            ),
          ),
          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Simplified Logo without glow effect
                    Container(
                      child: ClipOval(
                        child: Image.asset(
                          'assets/logo.jpg',
                          height: 130.0,
                          width: 130.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),

                    // Professional welcome text
                    Text(
                      'Welcome to HotelEase',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.brown[900],
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10.0),

                    // Refined slogan without italic style
                    Text(
                      'Luxury & Comfort Awaits',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.brown[700],
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 50.0),

                    // Login options with simplified design
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLoginOption(
                          context,
                          'assets/cust.jpg',
                          'I am a Customer',
                          'Bookings & more',
                          () {
                            Navigator.pushNamed(context, '/custlogin');
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: VerticalDivider(
                            width: 1.5,
                            color: Colors.brown[300],
                            thickness: 1.5,
                          ),
                        ),
                        _buildLoginOption(
                          context,
                          'assets/emp.jpg',
                          'I am an Employee',
                          'Schedules & tasks',
                          () {
                            Navigator.pushNamed(context, '/emplogin');
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 50.0),

                    // Custom Divider with subtle styling
                    Divider(
                      color: Colors.brown[400],
                      thickness: 1.5,
                      endIndent: 20,
                      indent: 20,
                    ),
                    const SizedBox(height: 30.0),

                    // Guest login button with professional design
                    GestureDetector(
                      onTap: () {
                        // Navigate to guestcust.dart when tapping 'Continue as Guest'
                        Navigator.pushNamed(context, '/guestcust');
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 32.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.brown[600]!,
                              Colors.brown[400]!,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 6.0,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.person_outline, color: Colors.white),
                            const SizedBox(width: 10.0),
                            Text(
                              'Continue as Guest',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Professional login option with refined design (No icons)
  Widget _buildLoginOption(BuildContext context, String imagePath, String title, String description, VoidCallback onTap, {double size = 120.0}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.brown[300],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                height: 90.0,
                width: 90.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown[900],
                ),
          ),
          const SizedBox(height: 6.0),
          SizedBox(
            width: size,
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.brown[700],
                    fontSize: 14.0,
                  ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown[600],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}