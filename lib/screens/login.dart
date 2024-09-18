import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/signin.jpg', // Correct path to the image
                  height: 400.0,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Text(
                'How would you like to login?',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/cust.jpg',
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.brown[700]!, Colors.brown[400]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                '/custlogin'); // Navigate to custlogin.dart
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .transparent, // Make the button transparent
                            shadowColor:
                                Colors.transparent, // Remove button shadow
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'I am a Customer',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 140.0,
                        child: Text(
                          'Access your bookings, reservations, and more',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 40.0),
                  Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/emp.jpg',
                          height: 80.0,
                          width: 80.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.brown[700]!, Colors.brown[400]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                '/emplogin'); // Navigate to employee login page
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors
                                .transparent, // Make the button transparent
                            shadowColor:
                                Colors.transparent, // Remove button shadow
                            padding: EdgeInsets.symmetric(
                                horizontal: 24.0, vertical: 12.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          child: Text(
                            'I am an Employee',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Container(
                        width: 140.0,
                        child: Text(
                          'View schedules and more',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      'Login as a Guest',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.instagram),
                    color: Colors.purple,
                    onPressed: () {
                      // Handle Instagram press
                    },
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.envelope),
                    color: Colors.red,
                    onPressed: () {
                      // Handle Gmail press
                    },
                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.twitter),
                    color: Colors.blue,
                    onPressed: () {
                      // Handle Twitter press
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
