import 'package:flutter/material.dart';
import 'dashboard.dart'; // Update this to the correct import path

class EmployeeFeedbackPage extends StatefulWidget {
  const EmployeeFeedbackPage({super.key});

  @override
  _EmployeeFeedbackPageState createState() => _EmployeeFeedbackPageState();
}

class _EmployeeFeedbackPageState extends State<EmployeeFeedbackPage>
    with SingleTickerProviderStateMixin {
  int selectedStars = 0;
  TextEditingController feedbackController = TextEditingController();
  bool submitted = false;
  bool isAnonymous = false;

  // Tags for employee feedback categories
  List<String> tags = [
    "Work Environment",
    "Management",
    "Facilities",
    "Work-Life Balance",
    "Training",
    "Career Growth",
    "Team Collaboration",
    "Compensation"
  ];

  List<String> selectedTags = [];
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.elasticOut,
    );
    // Ensure stars are available immediately
    _controller?.forward();
  }

  // Animation triggers on star tap, and stars are visible immediately
  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStars = index + 1;
          _controller?.reset();
          _controller?.forward(); // Trigger animation on tap
        });
      },
      child: ScaleTransition(
        scale: _animation!,
        child: Icon(
          index < selectedStars ? Icons.star : Icons.star_border,
          color: Colors.yellow[700], // Yellow stars
          size: 35, // Slightly bigger stars
        ),
      ),
    );
  }

  Widget buildTag(String tag) {
    return FilterChip(
      label: Text(tag),
      selected: selectedTags.contains(tag),
      onSelected: (bool value) {
        setState(() {
          if (value) {
            selectedTags.add(tag);
          } else {
            selectedTags.remove(tag);
          }
        });
      },
      selectedColor: Colors.brown[200],
      backgroundColor: Colors.brown[50],
      labelStyle: TextStyle(
        color: selectedTags.contains(tag) ? Colors.white : Colors.brown[800],
      ),
    );
  }

  void submitFeedback() {
    setState(() {
      submitted = true;
    });
    // Show success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Icon(Icons.check_circle, color: Colors.green, size: 40),
        content: const Text('Thank you for your feedback!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[800], // Darker brown background
      body: Stack(
        children: [
          // Back button at the top left corner
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                ); // Navigate to DashboardPage
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Gap of 2 cm before starting the content
                  const SizedBox(height: 40), // Approximately 2 cm

                  // Entire Review section wrapped in a container
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.brown[300], // Lighter brown background for container
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.brown.withOpacity(0.5),
                          blurRadius: 10,
                          offset: const Offset(0, 5), // Subtle shadow effect
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'We appreciate your feedback.',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.brown[800],
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Help us improve your work environment.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.brown[700],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        // Star Rating section (visible and functional from the start)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) => buildStar(index)),
                        ),
                        const SizedBox(height: 20),
                        // Feedback Tagging system
                        Text(
                          'Select areas for feedback:',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.brown[900],
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children: tags.map((tag) => buildTag(tag)).toList(),
                        ),
                        const SizedBox(height: 20),
                        // Review input box with character counter
                        TextField(
                          controller: feedbackController,
                          maxLines: 5,
                          maxLength: 200,
                          decoration: InputDecoration(
                            hintText: 'Write your feedback...',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                            counterText: '${feedbackController.text.length}/200',
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                        const SizedBox(height: 20),
                        // Anonymous feedback switch
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Submit anonymously?',
                              style: TextStyle(color: Colors.brown[800]),
                            ),
                            Switch(
                              value: isAnonymous,
                              onChanged: (value) {
                                setState(() {
                                  isAnonymous = value;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Submit button with animation
                        AnimatedOpacity(
                          opacity: submitted ? 0.5 : 1,
                          duration: const Duration(milliseconds: 500),
                          child: ElevatedButton(
                            onPressed: submitted ? null : submitFeedback,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[700], // Dark button
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}