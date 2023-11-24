import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProductDetailsScreen5(),
    );
  }
}

class ProductDetailsScreen5 extends StatefulWidget {
  @override
  _ProductDetailsScreen5State createState() => _ProductDetailsScreen5State();
}

class _ProductDetailsScreen5State extends State<ProductDetailsScreen5> {
  String? selectedSize;
  String? selectedColor;
  int? selectedQuantity;

  void _buyNow() async {
    if (selectedSize != null && selectedColor != null && selectedQuantity != null) {
      final CollectionReference products = FirebaseFirestore.instance.collection('products');

      await products.add({
        'size': selectedSize,
        'color': selectedColor,
        'quantity': selectedQuantity,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Items submitted to Firestore!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select size, color, and quantity.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('watch 1'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              // Handle favorite button press
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'asset/watch 1.jpg', // Replace with your watch image path
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'watch 1', // Replace with your watch name
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rs 500', // Replace with your watch price
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: selectedSize,
              hint: Text('Select Size'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedSize = newValue;
                });
              },
              items: <String>['S', 'M', 'L', 'XL']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
            ),
            DropdownButton<String>(
              value: selectedColor,
              hint: Text('Select Color'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedColor = newValue;
                });
              },
              items: <String>['Red', 'Blue', 'Green', 'Black']
                .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                })
                .toList(),
            ),
            DropdownButton<int>(
              value: selectedQuantity,
              hint: Text('Select Quantity'),
              onChanged: (int? newValue) {
                setState(() {
                  selectedQuantity = newValue;
                });
              },
              items: <int>[1, 2, 3, 4, 5]
                .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                })
                .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buyNow,
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}
