// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'roomdetails.dart'; // Import the RoomsPage
// // import 'paymenttype.dart'; // Import the PaymentPage
// // import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
// // import 'dart:math'; // For random number generation

// // class BookingForm extends StatefulWidget {
// //   @override
// //   _BookingFormState createState() => _BookingFormState();
// // }

// // class _BookingFormState extends State<BookingForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   String _selectedRoomType = 'Delux'; // Default room type
// //   DateTime? _checkInDate, _checkOutDate;
// //   TimeOfDay? _checkInTime, _checkOutTime;
// //   int _adults = 0, _children = 0;
// //   int? _assignedRoomNumber; // Assigned room number
// //   TextEditingController _specialRequestController = TextEditingController();

// //   // Function to select date
// //   Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(2020),
// //       lastDate: DateTime(2101),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         if (isCheckIn) {
// //           _checkInDate = picked;
// //         } else {
// //           _checkOutDate = picked;
// //         }
// //       });
// //     }
// //   }

// //   // Function to select time
// //   Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
// //     final TimeOfDay? picked = await showTimePicker(
// //       context: context,
// //       initialTime: TimeOfDay.now(),
// //     );
// //     if (picked != null) {
// //       setState(() {
// //         if (isCheckIn) {
// //           _checkInTime = picked;
// //         } else {
// //           _checkOutTime = picked;
// //         }
// //       });
// //     }
// //   }

// //   // Function to fetch available rooms and assign one
// //   Future<void> _assignRoomNumber(String roomType) async {
// //     DocumentSnapshot availableRoomsSnapshot = await FirebaseFirestore.instance
// //         .collection('AvailableRooms')
// //         .doc(roomType)
// //         .get();

// //     List<dynamic> availableRooms = availableRoomsSnapshot.get('rooms');

// //     if (availableRooms.isNotEmpty) {
// //       int randomIndex = Random().nextInt(availableRooms.length);
// //       int roomNumber = availableRooms[randomIndex];

// //       // Update the available rooms list by removing the assigned room
// //       availableRooms.removeAt(randomIndex);

// //       // Update the Firestore with the new list of available rooms
// //       await FirebaseFirestore.instance
// //           .collection('AvailableRooms')
// //           .doc(roomType)
// //           .update({'rooms': availableRooms});

// //       setState(() {
// //         _assignedRoomNumber = roomNumber;
// //       });
// //     } else {
// //       throw Exception('No available rooms for the selected room type');
// //     }
// //   }

// //   // Function to store booking data to Firestore
// //   Future<void> _saveBookingToFirestore() async {
// //     if (_formKey.currentState!.validate()) {
// //       // Assign a room number before saving
// //       await _assignRoomNumber(_selectedRoomType);

// //       // Combine date and time for check-in and check-out
// //       DateTime? checkInDateTime = _combineDateTime(_checkInDate, _checkInTime);
// //       DateTime? checkOutDateTime =
// //           _combineDateTime(_checkOutDate, _checkOutTime);

// //       // Data to save to Firestore
// //       Map<String, dynamic> bookingData = {
// //         'room_type': _selectedRoomType,
// //         'check_in_date': checkInDateTime,
// //         'check_out_date': checkOutDateTime,
// //         'adults': _adults,
// //         'children': _children,
// //         'special_request': _specialRequestController.text,
// //         'room_number': _assignedRoomNumber, // Store the assigned room number
// //       };

// //       // Save data to Firestore in the 'Booking' collection
// //       await FirebaseFirestore.instance.collection('Booking').add(bookingData);

// //       // After saving the booking, show the confirmation dialog
// //       _showBookingConfirmationDialog();
// //     }
// //   }

// //   DateTime? _combineDateTime(DateTime? date, TimeOfDay? time) {
// //     if (date == null || time == null) return null;
// //     return DateTime(
// //       date.year,
// //       date.month,
// //       date.day,
// //       time.hour,
// //       time.minute,
// //     );
// //   }

// //   // Function to show the booking confirmation dialog
// //   void _showBookingConfirmationDialog() {
// //     showDialog(
// //       context: context,
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           title: Text("Booking Confirmed"),
// //           content: Text(
// //               "Your booking has been confirmed for room $_assignedRoomNumber. Do you want to proceed to payment?"),
// //           actions: [
// //             TextButton(
// //               child: Text("Cancel"),
// //               onPressed: () {
// //                 Navigator.of(context).pop(); // Close the dialog
// //               },
// //             ),
// //             TextButton(
// //               child: Text("Proceed"),
// //               onPressed: () {
// //                 Navigator.of(context).pop(); // Close the dialog
// //                 Navigator.push(
// //                   context,
// //                   MaterialPageRoute(
// //                       builder: (context) =>
// //                           PaymentPage()), // Navigate to PaymentPage
// //                 );
// //               },
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF8C6239), // Brown color
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: Text('Book A Room'),
// //         centerTitle: true,
// //       ),
// //       body: Container(
// //         decoration: BoxDecoration(
// //           image: DecorationImage(
// //             image:
// //                 AssetImage('assets/background_image.jpg'), // Background image
// //             fit: BoxFit.cover,
// //           ),
// //         ),
// //         child: Center(
// //           child: Container(
// //             margin:
// //                 EdgeInsets.symmetric(horizontal: 16), // Add horizontal margin
// //             padding: EdgeInsets.all(16), // Add padding inside the beige box
// //             decoration: BoxDecoration(
// //               color: Color.fromARGB(255, 204, 146, 75)
// //                   .withOpacity(0.9), // Beige color with opacity
// //               borderRadius: BorderRadius.circular(12.0), // Rounded corners
// //             ),
// //             child: Form(
// //               key: _formKey,
// //               child: SingleChildScrollView(
// //                 child: Column(
// //                   children: [
// //                     buildDateField(
// //                         context, 'Check-in date', _checkInDate, true),
// //                     SizedBox(height: 8),
// //                     buildDateField(
// //                         context, 'Check-out date', _checkOutDate, false),
// //                     SizedBox(height: 8),
// //                     buildTimeField(
// //                         context, 'Check-in time', _checkInTime, true),
// //                     SizedBox(height: 8),
// //                     buildTimeField(
// //                         context, 'Check-out time', _checkOutTime, false),
// //                     SizedBox(height: 8),
// //                     Row(
// //                       children: [
// //                         buildCounterField('Adults', _adults, (val) {
// //                           setState(() {
// //                             _adults = val;
// //                           });
// //                         }),
// //                         SizedBox(width: 8),
// //                         buildCounterField('Children', _children, (val) {
// //                           setState(() {
// //                             _children = val;
// //                           });
// //                         }),
// //                       ],
// //                     ),
// //                     SizedBox(height: 16),
// //                     DropdownButtonFormField<String>(
// //                       value: _selectedRoomType,
// //                       decoration: InputDecoration(
// //                         labelText: 'Room Type',
// //                         filled: true,
// //                         fillColor: Colors.transparent,
// //                         labelStyle: TextStyle(color: Colors.black),
// //                         enabledBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Colors.black),
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Colors.black),
// //                         ),
// //                       ),
// //                       items: ['Delux', 'Standard', 'Double Standard']
// //                           .map((String type) {
// //                         return DropdownMenuItem<String>(
// //                           value: type,
// //                           child:
// //                               Text(type, style: TextStyle(color: Colors.black)),
// //                         );
// //                       }).toList(),
// //                       onChanged: (newValue) {
// //                         setState(() {
// //                           _selectedRoomType = newValue!;
// //                         });
// //                       },
// //                     ),
// //                     SizedBox(height: 16),
// //                     TextFormField(
// //                       controller: _specialRequestController,
// //                       decoration: InputDecoration(
// //                         labelText: 'Special Request',
// //                         filled: true,
// //                         fillColor: Colors.transparent,
// //                         labelStyle: TextStyle(color: Colors.black),
// //                         enabledBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Colors.black),
// //                         ),
// //                         focusedBorder: OutlineInputBorder(
// //                           borderSide: BorderSide(color: Colors.black),
// //                         ),
// //                       ),
// //                     ),
// //                     SizedBox(height: 16),
// //                     ElevatedButton(
// //                       onPressed: _saveBookingToFirestore,
// //                       style: ElevatedButton.styleFrom(
// //                         backgroundColor: Color(0xFF8C6239), // Brown color
// //                         padding: EdgeInsets.symmetric(vertical: 16),
// //                         textStyle: TextStyle(fontSize: 18),
// //                       ),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Text('Proceed to Pay',
// //                               style: TextStyle(color: Colors.white)),
// //                           Icon(Icons.payment, color: Colors.white),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildDateField(
// //       BuildContext context, String label, DateTime? date, bool isCheckIn) {
// //     return InkWell(
// //       onTap: () => _selectDate(context, isCheckIn),
// //       child: InputDecorator(
// //         decoration: InputDecoration(
// //           labelText: label,
// //           filled: true,
// //           fillColor: Colors.transparent,
// //           labelStyle: TextStyle(color: Colors.black),
// //           enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.black),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.black),
// //           ),
// //         ),
// //         child: Text(
// //           date == null ? 'dd/mm/yyyy' : DateFormat('dd/MM/yyyy').format(date),
// //           style: TextStyle(fontSize: 16, color: Colors.black),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildTimeField(
// //       BuildContext context, String label, TimeOfDay? time, bool isCheckIn) {
// //     return InkWell(
// //       onTap: () => _selectTime(context, isCheckIn),
// //       child: InputDecorator(
// //         decoration: InputDecoration(
// //           labelText: label,
// //           filled: true,
// //           fillColor: Colors.transparent,
// //           labelStyle: TextStyle(color: Colors.black),
// //           enabledBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.black),
// //           ),
// //           focusedBorder: OutlineInputBorder(
// //             borderSide: BorderSide(color: Colors.black),
// //           ),
// //         ),
// //         child: Text(
// //           time == null ? 'hh:mm' : time.format(context),
// //           style: TextStyle(fontSize: 16, color: Colors.black),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget buildCounterField(String label, int count, Function(int) onChange) {
// //     return Expanded(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(label, style: TextStyle(color: Colors.black)),
// //           Row(
// //             children: [
// //               IconButton(
// //                 icon: Icon(Icons.remove, color: Colors.black),
// //                 onPressed: () {
// //                   if (count > 0) onChange(count - 1);
// //                 },
// //               ),
// //               Text(count.toString(), style: TextStyle(color: Colors.black)),
// //               IconButton(
// //                 icon: Icon(Icons.add, color: Colors.black),
// //                 onPressed: () {
// //                   onChange(count + 1);
// //                 },
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'roomdetails.dart'; // Import the RoomsPage
// import 'paymenttype.dart'; // Import the PaymentPage
// import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
// import 'dart:math'; // For random number generation

// class BookingForm extends StatefulWidget {
//   @override
//   _BookingFormState createState() => _BookingFormState();
// }

// class _BookingFormState extends State<BookingForm> {
//   final _formKey = GlobalKey<FormState>();
//   String _selectedRoomType = 'Delux'; // Default room type
//   DateTime? _checkInDate, _checkOutDate;
//   TimeOfDay? _checkInTime, _checkOutTime;
//   int _adults = 0, _children = 0;
//   int? _assignedRoomNumber; // Assigned room number
//   TextEditingController _specialRequestController = TextEditingController();

//   // Function to select date
//   Future<void> _selectDate(BuildContext context, bool isCheckIn) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isCheckIn) {
//           _checkInDate = picked;
//         } else {
//           _checkOutDate = picked;
//         }
//       });
//     }
//   }

//   // Function to select time
//   Future<void> _selectTime(BuildContext context, bool isCheckIn) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isCheckIn) {
//           _checkInTime = picked;
//         } else {
//           _checkOutTime = picked;
//         }
//       });
//     }
//   }

//   // Function to fetch available rooms and assign one
//   Future<void> _assignRoomNumber(String roomType) async {
//     DocumentSnapshot availableRoomsSnapshot = await FirebaseFirestore.instance
//         .collection('AvailableRooms')
//         .doc(roomType)
//         .get();

//     List<dynamic> availableRooms = availableRoomsSnapshot.get('rooms');

//     if (availableRooms.isNotEmpty) {
//       int randomIndex = Random().nextInt(availableRooms.length);
//       int roomNumber = availableRooms[randomIndex];

//       // Update the available rooms list by removing the assigned room
//       availableRooms.removeAt(randomIndex);

//       // Update the Firestore with the new list of available rooms
//       await FirebaseFirestore.instance
//           .collection('AvailableRooms')
//           .doc(roomType)
//           .update({'rooms': availableRooms});

//       setState(() {
//         _assignedRoomNumber = roomNumber;
//       });
//     } else {
//       throw Exception('No available rooms for the selected room type');
//     }
//   }

//   // Function to store booking data to Firestore
//   Future<void> _saveBookingToFirestore() async {
//     if (_formKey.currentState!.validate()) {
//       // Assign a room number before saving
//       await _assignRoomNumber(_selectedRoomType);

//       // Combine date and time for check-in and check-out
//       DateTime? checkInDateTime = _combineDateTime(_checkInDate, _checkInTime);
//       DateTime? checkOutDateTime =
//           _combineDateTime(_checkOutDate, _checkOutTime);

//       // Data to save to Firestore
//       Map<String, dynamic> bookingData = {
//         'room_type': _selectedRoomType,
//         'check_in_date': checkInDateTime,
//         'check_out_date': checkOutDateTime,
//         'adults': _adults,
//         'children': _children,
//         'special_request': _specialRequestController.text,
//         'room_number': _assignedRoomNumber, // Store the assigned room number
//       };

//       // Save data to Firestore in the 'Booking' collection
//       await FirebaseFirestore.instance.collection('Booking').add(bookingData);

//       // After saving the booking, show the confirmation dialog
//       _showBookingConfirmationDialog();
//     }
//   }

//   DateTime? _combineDateTime(DateTime? date, TimeOfDay? time) {
//     if (date == null || time == null) return null;
//     return DateTime(
//       date.year,
//       date.month,
//       date.day,
//       time.hour,
//       time.minute,
//     );
//   }

//   // Function to show the booking confirmation dialog
//   void _showBookingConfirmationDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("Booking Confirmed"),
//           content: Text(
//               "Your booking has been confirmed for room $_assignedRoomNumber. Do you want to proceed to payment?"),
//           actions: [
//             TextButton(
//               child: Text("Cancel"),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//             ),
//             TextButton(
//               child: Text("Proceed"),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           PaymentPage()), // Navigate to PaymentPage
//                 );
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF8C6239), // Brown color
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text('Book A Room'),
//         centerTitle: true,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           image: DecorationImage(
//             image:
//                 AssetImage('assets/background_image.jpg'), // Background image
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Container(
//             margin:
//                 EdgeInsets.symmetric(horizontal: 16), // Add horizontal margin
//             padding: EdgeInsets.all(16), // Add padding inside the beige box
//             decoration: BoxDecoration(
//               color: Color.fromARGB(255, 204, 146, 75)
//                   .withOpacity(0.9), // Beige color with opacity
//               borderRadius: BorderRadius.circular(12.0), // Rounded corners
//             ),
//             child: Form(
//               key: _formKey,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     buildDateField(
//                         context, 'Check-in date', _checkInDate, true),
//                     SizedBox(height: 8),
//                     buildDateField(
//                         context, 'Check-out date', _checkOutDate, false),
//                     SizedBox(height: 8),
//                     buildTimeField(
//                         context, 'Check-in time', _checkInTime, true),
//                     SizedBox(height: 8),
//                     buildTimeField(
//                         context, 'Check-out time', _checkOutTime, false),
//                     SizedBox(height: 8),
//                     Row(
//                       children: [
//                         buildCounterField('Adults', _adults, (val) {
//                           setState(() {
//                             _adults = val;
//                           });
//                         }),
//                         SizedBox(width: 8),
//                         buildCounterField('Children', _children, (val) {
//                           setState(() {
//                             _children = val;
//                           });
//                         }),
//                       ],
//                     ),
//                     SizedBox(height: 16),
//                     DropdownButtonFormField<String>(
//                       value: _selectedRoomType,
//                       decoration: InputDecoration(
//                         labelText: 'Room Type',
//                         filled: true,
//                         fillColor: Colors.transparent,
//                         labelStyle: TextStyle(color: Colors.black),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                       ),
//                       items: ['Delux', 'Standard', 'Double Standard']
//                           .map((String type) {
//                         return DropdownMenuItem<String>(
//                           value: type,
//                           child:
//                               Text(type, style: TextStyle(color: Colors.black)),
//                         );
//                       }).toList(),
//                       onChanged: (newValue) {
//                         setState(() {
//                           _selectedRoomType = newValue!;
//                         });
//                       },
//                     ),
//                     SizedBox(height: 16),
//                     TextFormField(
//                       controller: _specialRequestController,
//                       decoration: InputDecoration(
//                         labelText: 'Special Request',
//                         filled: true,
//                         fillColor: Colors.transparent,
//                         labelStyle: TextStyle(color: Colors.black),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 16),
//                     ElevatedButton(
//                       onPressed: _saveBookingToFirestore,
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF8C6239), // Brown color
//                         padding: EdgeInsets.symmetric(vertical: 16),
//                         textStyle: TextStyle(fontSize: 18),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text('Proceed to Pay',
//                               style: TextStyle(color: Colors.white)),
//                           Icon(Icons.payment, color: Colors.white),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildDateField(
//       BuildContext context, String label, DateTime? date, bool isCheckIn) {
//     return InkWell(
//       onTap: () => _selectDate(context, isCheckIn),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           filled: true,
//           fillColor: Colors.transparent,
//           labelStyle: TextStyle(color: Colors.black),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//         child: Text(
//           date == null ? 'dd/mm/yyyy' : DateFormat('dd/MM/yyyy').format(date),
//           style: TextStyle(fontSize: 16, color: Colors.black),
//         ),
//       ),
//     );
//   }

//   Widget buildTimeField(
//       BuildContext context, String label, TimeOfDay? time, bool isCheckIn) {
//     return InkWell(
//       onTap: () => _selectTime(context, isCheckIn),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           filled: true,
//           fillColor: Colors.transparent,
//           labelStyle: TextStyle(color: Colors.black),
//           enabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.black),
//           ),
//         ),
//         child: Text(
//           time == null ? 'hh:mm' : time.format(context),
//           style: TextStyle(fontSize: 16, color: Colors.black),
//         ),
//       ),
//     );
//   }

//   Widget buildCounterField(String label, int count, Function(int) onChange) {
//     return Expanded(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(label, style: TextStyle(color: Colors.black)),
//           Row(
//             children: [
//               IconButton(
//                 icon: Icon(Icons.remove, color: Colors.black),
//                 onPressed: () {
//                   if (count > 0) onChange(count - 1);
//                 },
//               ),
//               Text(count.toString(), style: TextStyle(color: Colors.black)),
//               IconButton(
//                 icon: Icon(Icons.add, color: Colors.black),
//                 onPressed: () {
//                   onChange(count + 1);
//                 },
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'roomdetails.dart'; // Import the RoomsPage
import 'paymenttype.dart'; // Import the PaymentPage
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import
import 'dart:math'; // For random number generation

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

  // Function to select time
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

      // After saving the booking, show the confirmation dialog
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentPage()), // Navigate to PaymentPage
                );
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
        title: Text('Book A Room'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
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
                      decoration: InputDecoration(
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
                      items: ['Delux', 'Standard', 'Double Standard']
                          .map((String type) {
                        return DropdownMenuItem<String>(
                          value: type,
                          child:
                              Text(type, style: TextStyle(color: Colors.black)),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          _selectedRoomType = newValue!;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _specialRequestController,
                      decoration: InputDecoration(
                        labelText: 'Special Request',
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
                      onPressed: _saveBookingToFirestore,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF8C6239), // Brown color
                        padding: EdgeInsets.symmetric(vertical: 16),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Proceed to Pay',
                              style: TextStyle(color: Colors.white)),
                          Icon(Icons.payment, color: Colors.white),
                        ],
                      ),
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

  Widget buildDateField(
      BuildContext context, String label, DateTime? date, bool isCheckIn) {
    return InkWell(
      onTap: () => _selectDate(context, isCheckIn),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
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
        child: Text(
          date == null ? 'dd/mm/yyyy' : DateFormat('dd/MM/yyyy').format(date),
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildTimeField(
      BuildContext context, String label, TimeOfDay? time, bool isCheckIn) {
    return InkWell(
      onTap: () => _selectTime(context, isCheckIn),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
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
        child: Text(
          time == null ? 'hh:mm' : time.format(context),
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget buildCounterField(String label, int count, Function(int) onChange) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black)),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.remove, color: Colors.black),
                onPressed: () {
                  if (count > 0) onChange(count - 1);
                },
              ),
              Text(count.toString(), style: TextStyle(color: Colors.black)),
              IconButton(
                icon: Icon(Icons.add, color: Colors.black),
                onPressed: () {
                  onChange(count + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
