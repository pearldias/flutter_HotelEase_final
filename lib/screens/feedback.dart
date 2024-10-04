import 'package:flutter/material.dart';
import 'success.dart'; // Import the success screen
import 'package:app/screens/success.dart';  // Adjust if needed

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int _rating = 0;
  TextEditingController _reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8C6239), // Brown color for the app bar
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('FEEDBACK'),
        centerTitle: true,
      ),
      body: Stack( // Use Stack to overlay the background image and content
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.jpg'), // Background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Light beige box
          // Main content
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 24.0), // Set left, top, right, bottom padding
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 146, 75).withOpacity(0.9), //beige box
                borderRadius: BorderRadius.circular(12.0), // Rounded corners for the box
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Padding inside the box
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'We appreciate your feedback.',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Change text color to black for visibility
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'We are always looking for ways to improve your experience.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Change text color to black for visibility
                      ),
                    ),
                    SizedBox(height: 16),
                    // Star rating
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(5, (index) {
                        return IconButton(
                          icon: Icon(
                            index < _rating ? Icons.star : Icons.star_border,
                            color: const Color.fromARGB(255, 227, 206, 19),
                          ),
                          onPressed: () {
                            setState(() {
                              _rating = index + 1;
                            });
                          },
                        );
                      }),
                    ),
                    SizedBox(height: 16),
                    // Review text field
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        controller: _reviewController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Write a review...',
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    // Submit button
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to the SuccessScreen after submission
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SuccessScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8C6239),
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
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