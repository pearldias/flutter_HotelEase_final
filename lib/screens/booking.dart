import 'package:app/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'dart:math'; // For random number generation
import 'stripe_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart'; // Correct Stripe package import
import 'success.dart';

class BookingForm extends StatefulWidget {
  @override
  _BookingFormState createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedRoomType = 'Delux'; // Default room type
  DateTime? _checkInDate, _checkOutDate;
  TimeOfDay? _checkInTime, _checkOutTime;
  int _adults = 0, _children = 0;
  int? _assignedRoomNumber; // Assigned room number
  TextEditingController _specialRequestController = TextEditingController();

  // Function to select date
  Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInDate = picked;
        } else {
          _checkOutDate = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isCheckIn) {
          _checkInTime = picked;
        } else {
          _checkOutTime = picked;
        }
      });
    }
  }

  // Function to fetch available rooms and assign one from 1 to 5
  Future<void> _assignRoomNumber(String roomType) async {
    DocumentSnapshot availableRoomsSnapshot = await FirebaseFirestore.instance
        .collection('AvailableRooms')
        .doc(roomType)
        .get();

    List<dynamic> availableRooms = availableRoomsSnapshot.get('rooms');

    if (availableRooms.isNotEmpty) {
      int randomIndex = Random().nextInt(availableRooms.length);
      int roomNumber = availableRooms[randomIndex];

      // Update the available rooms list by removing the assigned room
      availableRooms.removeAt(randomIndex);

      // Update the Firestore with the new list of available rooms
      await FirebaseFirestore.instance
          .collection('AvailableRooms')
          .doc(roomType)
          .update({'rooms': availableRooms});

      setState(() {
        _assignedRoomNumber = roomNumber;
      });
    } else {
      throw Exception('No available rooms for the selected room type');
    }
  }

  // Function to store booking data to Firestore
  Future<void> _saveBookingToFirestore() async {
    if (_formKey.currentState!.validate()) {
      // Assign a room number before saving
      await _assignRoomNumber(_selectedRoomType);

      // Combine date and time for check-in and check-out
      DateTime? checkInDateTime = _combineDateTime(_checkInDate, _checkInTime);
      DateTime? checkOutDateTime =
          _combineDateTime(_checkOutDate, _checkOutTime);

      // Data to save to Firestore
      Map<String, dynamic> bookingData = {
        'room_type': _selectedRoomType,
        'check_in_date': checkInDateTime,
        'check_out_date': checkOutDateTime,
        'adults': _adults,
        'children': _children,
        'special_request': _specialRequestController.text,
        'room_number': _assignedRoomNumber, // Store the assigned room number
      };

      // Save data to Firestore in the 'Booking' collection
      await FirebaseFirestore.instance.collection('Booking').add(bookingData);

      // After saving the booking, show the payment dialog
      _showBookingConfirmationDialog();
    }
  }

  DateTime? _combineDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return null;
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  // Function to show the booking confirmation dialog
  void _showBookingConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Booking Confirmed"),
          content: Text(
              "Room No. $_assignedRoomNumber ($_selectedRoomType) booked. Do you want to proceed to payment?"),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text("Proceed"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _handlePayment(); // Start the payment process
              },
            ),
          ],
        );
      },
    );
  }

  // Function to handle Stripe payment
  Future<void> _handlePayment() async {
    try {
      // Call the StripeService to handle the payment
      await StripeService.instance
          .makePayment(100, "inr", context); // Example amount in INR

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HomePage()), // Payment success page
      );
    } catch (e) {
      // Handle payment errors (e.g., card declined)
      _showPaymentErrorDialog();
    }
  }

  // Function to show payment error dialog
  void _showPaymentErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Payment Failed"),
          content: const Text(
              "There was an issue processing your payment. Please try again."),
          actions: [
            TextButton(
              child: Text("Retry"),
              onPressed: () {
                Navigator.of(context).pop();
                _handlePayment(); // Retry payment
              },
            ),
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop(); // Cancel payment
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8C6239), // Brown color
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // title: Text('Book A Room'), // Removed title
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('assets/background_image.jpg'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            margin:
                EdgeInsets.symmetric(horizontal: 16), // Add horizontal margin
            padding: EdgeInsets.all(16), // Add padding inside the beige box
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 204, 146, 75)
                  .withOpacity(0.9), // Beige color with opacity
              borderRadius: BorderRadius.circular(12.0), // Rounded corners
            ),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildDateField(
                        context, 'Check-in date', _checkInDate, true),
                    SizedBox(height: 8),
                    buildDateField(
                        context, 'Check-out date', _checkOutDate, false),
                    SizedBox(height: 8),
                    buildTimeField(
                        context, 'Check-in time', _checkInTime, true),
                    SizedBox(height: 8),
                    buildTimeField(
                        context, 'Check-out time', _checkOutTime, false),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        buildCounterField('Adults', _adults, (val) {
                          setState(() {
                            _adults = val;
                          });
                        }),
                        SizedBox(width: 8),
                        buildCounterField('Children', _children, (val) {
                          setState(() {
                            _children = val;
                          });
                        }),
                      ],
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: _selectedRoomType,
                      decoration: const InputDecoration(
                        labelText: 'Room Type',
                        filled: true,
                        fillColor: Colors.transparent,
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                      items: ['Delux', 'Standard', 'DoubleStandard']
                          .map((roomType) => DropdownMenuItem<String>(
                                value: roomType,
                                child: Text(roomType),
                              ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedRoomType = value!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _specialRequestController,
                      decoration: const InputDecoration(
                        labelText: 'Special Requests',
                        filled: true,
                        fillColor: Colors.transparent,
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 66, 36, 7), // Dark brown background color
                        foregroundColor: const Color.fromARGB(255, 241, 238, 237), // Set text color to brown
                      ),
                      onPressed: _saveBookingToFirestore,
                      child: const Text('Book Now'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateField(BuildContext context, String label, DateTime? date,
      bool isCheckIn) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      onTap: () => _selectDate(context, isCheckIn),
      controller: TextEditingController(
        text: date != null ? DateFormat.yMd().format(date) : '',
      ),
    );
  }

  Widget buildTimeField(
      BuildContext context, String label, TimeOfDay? time, bool isCheckIn) {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.transparent,
        labelStyle: const TextStyle(color: Colors.black),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      onTap: () => _selectTime(context, isCheckIn),
      controller: TextEditingController(
        text: time != null ? time.format(context) : '',
      ),
    );
  }

  Widget buildCounterField(String label, int value,
      ValueChanged<int> onChanged) {
    return Column(
      children: [
        Text(label),
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                if (value > 0) {
                  onChanged(value - 1);
                }
              },
            ),
            Text(value.toString()),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                onChanged(value + 1);
              },
            ),
          ],
        ),
      ],
    );
  }
}