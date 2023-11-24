import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VisaCardReaderPage extends StatefulWidget {
  @override
  _VisaCardReaderPageState createState() => _VisaCardReaderPageState();
}

class _VisaCardReaderPageState extends State<VisaCardReaderPage> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvvController = TextEditingController();

  bool areCardDetailsValid = false; // Track whether card details are valid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Visa Card Reader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Icon(
                Icons.credit_card,
                size: 100,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Please enter your Visa card details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                hintText: 'XXXX XXXX XXXX XXXX', // Format hint as needed
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: expiryController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: 'Expiration Date (MM/YY)',
                      hintText: 'MM/YY',
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: cvvController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: areCardDetailsValid ? () => _processPayment(context) : null,
                // Disable button if card details are not valid
                child: Text('Pay Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Validate card details
  bool _validateCardDetails() {
    // Implement your validation logic here
    // For example, you can check card number length, expiry date format, etc.
    // Return true if details are valid, false otherwise
    // For this example, we'll assume card details are valid if they are not empty

    final cardNumber = cardNumberController.text.trim();
    final expiry = expiryController.text.trim();
    final cvv = cvvController.text.trim();

    return cardNumber.isNotEmpty && expiry.isNotEmpty && cvv.isNotEmpty;
  }

  void _processPayment(BuildContext context) {
    // Implement your payment processing logic here
    // For example, you can make a payment request to a payment gateway

    // Once the payment is successful, you can call a function to clear the cart
    _clearCart();

    // Show a payment confirmation dialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Confirmation'),
          content: Text('Your payment was successful!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _clearCart() async {
    final QuerySnapshot cartQuery =
        await FirebaseFirestore.instance.collection('products').get();

    final batch = FirebaseFirestore.instance.batch();

    // Delete all documents in the "cart" collection
    cartQuery.docs.forEach((doc) {
      batch.delete(doc.reference);
    });

    // Commit the batched delete operation
    await batch.commit();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Listen to changes in card details to update the button state
    cardNumberController.addListener(_updateButtonState);
    expiryController.addListener(_updateButtonState);
    cvvController.addListener(_updateButtonState);
  }

  // Update the button state based on card details validity
  void _updateButtonState() {
    setState(() {
      areCardDetailsValid = _validateCardDetails();
    });
  }
}

// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:projectking/payment.dart';

// class VisaCardReaderPage extends StatefulWidget {
  
//   @override
//   _VisaCardReaderPageState createState() => _VisaCardReaderPageState();
  
// }

// class _VisaCardReaderPageState extends State<VisaCardReaderPage> {
  
//   TextEditingController cardNumberController = TextEditingController();
//   TextEditingController expiryController = TextEditingController();
//   TextEditingController cvvController = TextEditingController();
// bool areCardDetailsValid = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Visa Card Reader'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Icon(
//                 Icons.credit_card,
//                 size: 100,
//                 color: Colors.blue,
//               ),
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Please enter your Visa card details',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 16),
//             TextField(
//               controller: cardNumberController,
//               keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                 labelText: 'Card Number',
//                 hintText: 'XXXX XXXX XXXX XXXX', // Format hint as needed
//               ),
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: expiryController,
//                     keyboardType: TextInputType.datetime,
//                     decoration: InputDecoration(
//                       labelText: 'Expiration Date (MM/YY)',
//                       hintText: 'MM/YY',
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: TextField(
//                     controller: cvvController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       labelText: 'CVV',
//                       hintText: 'XXX',
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Center(
//                child: ElevatedButton(
//                 onPressed: areCardDetailsValid ? () => _processPayment(context) : null,
//                 // Disable button if card details are not valid
//                 child: Text('Pay Now'),
//               ),
//               // child: ElevatedButton(
//               //   onPressed: () {
//               //     // Implement card validation and payment processing here
//               //     _processPayment(context);
//               //   },
//               //   child: Text('Pay Now'),
//               // ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// bool _validateCardDetails() {
//     // Implement your validation logic here
//     // For example, you can check card number length, expiry date format, etc.
//     // Return true if details are valid, false otherwise
//     // For this example, we'll assume card details are valid if they are not empty

//     final cardNumber = cardNumberController.text.trim();
//     final expiry = expiryController.text.trim();
//     final cvv = cvvController.text.trim();

//     return cardNumber.isNotEmpty && expiry.isNotEmpty && cvv.isNotEmpty;
//   }
//   void _processPayment(BuildContext context) {
//     // Implement your payment processing logic here
//     // For example, you can make a payment request to a payment gateway

//     // Once the payment is successful, you can call a function to clear the cart
//     _clearCart();

//     // Show a payment confirmation dialog
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Payment Confirmation'),
//           content: Text('Your payment was successful!'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _clearCart() async {
//     final QuerySnapshot cartQuery =
//         await FirebaseFirestore.instance.collection('products').get();

//     final batch = FirebaseFirestore.instance.batch();

//     // Delete all documents in the "cart" collection
//     cartQuery.docs.forEach((doc) {
//       batch.delete(doc.reference);
//     });

//     // Commit the batched delete operation
//     await batch.commit();
//   }

//   @override
//   void dispose() {
//     cardNumberController.dispose();
//     expiryController.dispose();
//     cvvController.dispose();
//     super.dispose();
    
//   }
// }

// // import 'package:flutter/material.dart';

// // class VisaCardReaderPage extends StatefulWidget {
// //   @override
// //   _VisaCardReaderPageState createState() => _VisaCardReaderPageState();
// // }

// // class _VisaCardReaderPageState extends State<VisaCardReaderPage> {
// //   TextEditingController cardNumberController = TextEditingController();
// //   TextEditingController expiryController = TextEditingController();
// //   TextEditingController cvvController = TextEditingController();

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Visa Card Reader'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Center(
// //               child: Icon(
// //                 Icons.credit_card,
// //                 size: 100,
// //                 color: Colors.blue,
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             Text(
// //               'Please enter your Visa card details',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             TextField(
// //               controller: cardNumberController,
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(
// //                 labelText: 'Card Number',
// //                 hintText: 'XXXX XXXX XXXX XXXX', // Format hint as needed
// //               ),
// //             ),
// //             SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: TextField(
// //                     controller: expiryController,
// //                     keyboardType: TextInputType.datetime,
// //                     decoration: InputDecoration(
// //                       labelText: 'Expiration Date (MM/YY)',
// //                       hintText: 'MM/YY',
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(width: 16),
// //                 Expanded(
// //                   child: TextField(
// //                     controller: cvvController,
// //                     keyboardType: TextInputType.number,
// //                     decoration: InputDecoration(
// //                       labelText: 'CVV',
// //                       hintText: 'XXX',
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //             Center(
// //               child: ElevatedButton(
// //                 onPressed: () {
// //                   // Implement card validation and payment processing here
// //                   _processPayment(context);
// //                 },
// //                 child: Text('Pay Now'),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _processPayment(BuildContext context) {
// //     showDialog(
// //       context: context,
// //       builder: (context) {
// //         return AlertDialog(
// //           title: Text('Payment Confirmation'),
// //           content: Text('Your payment was successful!'),
// //           actions: [
// //             TextButton(
// //               onPressed: () {
// //                 Navigator.of(context).pop();
// //               },
// //               child: Text('OK'),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     cardNumberController.dispose();
// //     expiryController.dispose();
// //     cvvController.dispose();
// //     super.dispose();
// //   }
// // }
