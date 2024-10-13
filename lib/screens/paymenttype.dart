import 'package:flutter/material.dart';
import 'success.dart'; // Import the SuccessScreen class

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Payment Page',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.lock_outline, color: Colors.black),
            onPressed: () {
              // Lock action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Choose your payment method',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              // Payment Method Card
              Container(
                decoration: BoxDecoration(
                  color: Colors.brown.shade200,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Credit Card Payment
                    _buildPaymentOption(
                      context,
                      'Credit Card Payment',
                      Icons.credit_card,
                      [
                        _buildTextField('XXXX-XXXX-XXXX-XXXX', ''),
                        _buildTextField('CVV', ''),
                      ],
                    ),
                    Divider(color: Colors.brown),

                    // Mobile UPI Payment
                    _buildPaymentOption(
                      context,
                      'Mobile UPI Payment',
                      Icons.account_balance_wallet,
                      [_buildTextField('upi-id@okicici', '')],
                    ),
                    Divider(color: Colors.brown),

                    // Net Banking Payment
                    _buildPaymentOption(
                      context,
                      'Net Banking',
                      Icons.account_balance,
                      [
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Choose your bank account',
                          ),
                          items:
                              ['Bank 1', 'Bank 2', 'Bank 3'].map((String bank) {
                            return DropdownMenuItem<String>(
                              value: bank,
                              child: Text(bank),
                            );
                          }).toList(),
                          onChanged: (value) {
                            // Handle bank selection
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Proceed with Payment Button
              ElevatedButton(
                onPressed: () {
                  // Navigate to the SuccessScreen when payment is processed
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SuccessScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade400,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Proceed with Payment',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to build payment options
  Widget _buildPaymentOption(
      BuildContext context, String title, IconData icon, List<Widget> fields) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.black),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Column(children: fields),
      ],
    );
  }

  // Function to build text fields for payment details
  Widget _buildTextField(String placeholder, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: TextStyle(color: Colors.brown.shade600),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        ),
      ),
    );
  }
}
