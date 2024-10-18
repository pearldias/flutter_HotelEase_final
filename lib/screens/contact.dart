import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  // Function to make phone call
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // Function to send email
  void _sendEmail(String email) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    await launchUrl(emailLaunchUri);
  }

  // Function to send WhatsApp message
  void _sendWhatsAppMessage(String phoneNumber) async {
    final Uri whatsappUri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
    );
    await launchUrl(whatsappUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 72.0, left: 16.0, right: 16.0), // Increase top padding
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Contact Information Section
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.brown[100],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'We\'re here to assist you! Reach out to us via the following:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.brown,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Phone Contact Section
                        _buildContactItem(
                          context,
                          icon: Icons.phone,
                          title: 'Phone',
                          contactInfo: '9322689394',
                          onTap: () => _makePhoneCall('9322689394'),
                        ),
                        const SizedBox(height: 20),
                        // Email Contact Section
                        _buildContactItem(
                          context,
                          icon: Icons.email,
                          title: 'Email',
                          contactInfo: 'hotel.ease00@gmail.com',
                          onTap: () => _sendEmail('hotel.ease00@gmail.com'),
                        ),
                        const SizedBox(height: 20),
                        // WhatsApp Contact Section
                        _buildContactItem(
                          context,
                          icon: Icons.chat,
                          title: 'WhatsApp',
                          contactInfo: '9322689394',
                          onTap: () => _sendWhatsAppMessage('9322689394'),
                        ),
                        const SizedBox(height: 20),
                        // Business Hours Section
                        _buildContactItem(
                          context,
                          icon: Icons.access_time,
                          title: 'Business Hours',
                          contactInfo: 'Mon - Fri, 9 AM - 6 PM',
                          onTap: () {
                            // Placeholder for any action when tapping business hours
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Feedback or Message Section
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.brown[200],
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Have any questions or feedback?',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                            hintText: 'Type your message here...',
                            fillColor: Colors.brown[50],
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.brown[300]!,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              // Show Snackbar when feedback is submitted
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text('Your feedback was received!'),
                                  backgroundColor: Colors.brown[700],
                                  behavior: SnackBarBehavior.floating,
                                  duration: const Duration(seconds: 3),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[700],
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Submit Feedback',
                              style: TextStyle(color: Colors.white),
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
          // Back button at top left corner
          Positioned(
            top: 16.0,
            left: 16.0,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);  // Navigate back
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget to build contact information items
  Widget _buildContactItem(BuildContext context,
      {required IconData icon, required String title, required String contactInfo, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        decoration: BoxDecoration(
          color: Colors.brown[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.brown[800], size: 30),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  contactInfo,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.brown[600],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}