import 'package:flutter/material.dart';
import 'package:projectking/DeliveryPage.dart';
import 'package:projectking/carddetals.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomLeft,
            colors: [Colors.green, Colors.orange],
          )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Payment Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Total Amount: Rs 500',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Credit Card'),
                subtitle: Text('Pay with your credit card'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            VisaCardReaderPage()), // Navigate to the payment page
                  );
                },
              ),
              ListTile(
                leading: Icon(Icons.payment),
                title: Text('Other Payment Methods'),
                subtitle: Text('View more payment options'),
                onTap: () {
                   Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DeliveryPage()), // Navigate to the payment page
                  );

                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentConfirmationDialog(BuildContext context) {
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

  void _showPaymentOptionsMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('View more payment options on the payment options page.'),
      ),
    );
  }
}
