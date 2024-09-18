import 'package:flutter/material.dart';

class CustLoginScreen extends StatefulWidget {
  const CustLoginScreen({super.key});

  @override
  _CustLoginScreenState createState() => _CustLoginScreenState();
}

class _CustLoginScreenState extends State<CustLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Login'),
        backgroundColor: Colors.brown,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgloginimg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login Form
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.brown),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      onPressed: () {
                        // Handle login logic
                        print('Email: ${_emailController.text}');
                        print('Password: ${_passwordController.text}');
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Navigate to the Reset Password Screen
                            Navigator.pushNamed(context, '/resetpass');
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to the Signup Page
                            Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class CustLoginScreen extends StatelessWidget {
  const CustLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/bg.jpg'), // Path to your background image
                fit: BoxFit.cover, // Make the image cover the whole screen
              ),
            ),
          ),

          // Foreground content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE0B89F), // Light mocha color
                  borderRadius: BorderRadius.circular(16.0), // Curved edges
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi, Welcome Back! 👋',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F4E37), // Mocha color
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Hello again, you’ve been missed!',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors
                            .black87, // Lighter text color for better contrast
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.white, // White background for text fields
                        labelText: 'CUSTOMER EMAIL',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.white, // White background for text fields
                        labelText: 'PASSWORD',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add login functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF6F4E37), // Mocha color for button
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style:
                            TextStyle(color: Colors.white), // White text color
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // "Don't have an account? Sign Up" Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.black87),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigate to the SignupPage
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(
                                    0xFF6F4E37)), // Mocha color for Sign Up text
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
/*import 'package:flutter/material.dart';

class CustLoginScreen extends StatelessWidget {
  const CustLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/bg.jpg'), // Path to your background image
                fit: BoxFit.cover, // Make the image cover the whole screen
              ),
            ),
          ),

          // Foreground content
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Color(0xFFE0B89F), // Light mocha color
                  borderRadius: BorderRadius.circular(16.0), // Curved edges
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 8,
                      color: Colors.black.withOpacity(0.25),
                      spreadRadius: 3,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Hi, Welcome Back! 👋',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF6F4E37), // Mocha color
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Hello again, you’ve been missed!',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors
                            .black87, // Lighter text color for better contrast
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.white, // White background for text fields
                        labelText: 'CUSTOMER EMAIL',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor:
                            Colors.white, // White background for text fields
                        labelText: 'PASSWORD',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 30.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add login functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Color(0xFF6F4E37), // Mocha color for button
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(12.0), // Curved edges
                        ),
                      ),
                      child: Text(
                        'Log In',
                        style:
                            TextStyle(color: Colors.white), // White text color
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/