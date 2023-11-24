import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectking/cartPage.dart';

class WatchDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> watch;
  final Map<String, String> colorOptions;

  WatchDetailsScreen({required this.watch,required this.colorOptions});

  @override
  _WatchDetailsScreenState createState() => _WatchDetailsScreenState();
}

class _WatchDetailsScreenState extends State<WatchDetailsScreen> {
  String? selectedSize;
  
  int? selectedQuantity;
  String selectedColor = ''; 
late String selectedImageUrl;

  void _addToCart() async {
    if (selectedSize != null && selectedColor != null && selectedQuantity != null) {
      final CollectionReference cartItems = FirebaseFirestore.instance.collection('cart');
await FirebaseFirestore.instance.collection('products').add({
      'name': widget.watch['name'],
      'price': widget.watch['price'],
      'size': selectedSize,
      'color': selectedColor,
      'quantity': selectedQuantity,
    });

      // await cartItems.add({
      //   'name': widget.watch['name'],
      //   'price': widget.watch['price'],
      //   'size': selectedSize,
      //   'color': selectedColor,
      //   'quantity': selectedQuantity,
      // });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item added to cart!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please select size, color, and quantity.')));
    }
  }
  @override
  void initState() {
    super.initState();
     final colorKeys = widget.colorOptions.keys.toList();
    selectedColor = colorKeys.isNotEmpty ? colorKeys[0] : '';
    selectedImageUrl = widget.colorOptions[selectedColor] ?? '';
    }
    
  Color getWatchColor(String selectedColor) {
  switch (selectedColor) {
    case 'Red':
      return Colors.red;
    case 'Blue':
      return Colors.blue;
    case 'Green':
      return Colors.green;
    case 'Yellow':
      return Colors.yellow;
    default:
      return Colors.black; // Default color
  }
}
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Watch Details'),
      actions: [
        IconButton(
          onPressed: () {
             // Navigate to the sign-in page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage1()),
                    );
            // Implement cart navigation logic here
          },
          icon: Icon(Icons.shopping_cart),
        ),
      ],
    ),
    body: SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           Text("Selected Color: $selectedColor"),
          Image.asset(selectedImageUrl), 
          // Image.network(
          //   widget.watch['image_url'],
          //   height: 200,
          //   width: 200,
          //   fit: BoxFit.cover,
          // ),
          SizedBox(height: 20),
          Text(
            widget.watch['name'],
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 10),
          Text(
            'Rs ${widget.watch['price']}',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          RatingBar.builder(
            initialRating: widget.watch['rating'] != null ? widget.watch['rating'].toDouble() : 0.0,
            minRating: 0,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 30,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {
              // Handle rating updates here if needed
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Center the input fields
            children: [
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
                }).toList(),
              ),
              SizedBox(width: 4), 
              DropdownButton<String>(
            value: selectedColor,
            onChanged: (String? newValue) {
              setState(() {
                selectedColor = newValue!;
                selectedImageUrl = widget.colorOptions[selectedColor] ?? '';
              });
            },
            items: widget.colorOptions.keys.map((String color) {
              return DropdownMenuItem<String>(
                value: color,
                child: Text(color),
              );
            }).toList(),
          ),
 Container(
      width: 20,
      height: 20,
      color: getWatchColor(selectedColor),
    ), 
              // Add space between dropdowns
              // DropdownButton<String>(
              //   value: selectedColor,
              //   hint: Text('Select Color'),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       selectedColor = newValue;
              //     });
              //   },
              //   items: <String>['Red', 'Blue', 'Green', 'Black']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),
              SizedBox(width: 4), // Add space between dropdowns
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
                }).toList(),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _addToCart,
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ],
          ),
           Text(
              'Best Sellers',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 10),

            // GridView for Best Sellers
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('Bestsellers').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                // Extract best seller data from Firestore and create a GridView
                final bestSellers = snapshot.data!.docs;

                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                  ),
                  itemCount: bestSellers.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final bestSeller = bestSellers[index];
                    final bestSellerData = bestSeller.data() as Map<String, dynamic>;

                    return GestureDetector(
                      onTap: () {
                        
                       
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Image.network(
                              bestSellerData['image_url'],
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              bestSellerData['name'],
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Rs ${bestSellerData['price']}',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 4.0),
                           
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
     
      )],
      ),
    ),
  );
}
}
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text('Watch Details'),
//       actions: [
//         IconButton(
//           onPressed: () {
//             // Implement cart navigation logic here
//           },
//           icon: Icon(Icons.shopping_cart),
//         ),
//       ],
//     ),
//     body: SingleChildScrollView(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Image.network(
//             widget.watch['image_url'],
//             height: 200,
//             width: 200,
//             fit: BoxFit.cover,
//           ),
//           SizedBox(height: 20),
//           Text(
//             widget.watch['name'],
//             style: TextStyle(fontSize: 24),
//           ),
//           SizedBox(height: 10),
//           Text(
//             'Rs ${widget.watch['price']}',
//             style: TextStyle(fontSize: 20),
//           ),
//           SizedBox(height: 10),
//           RatingBar.builder(
//             initialRating: widget.watch['rating'] != null ? widget.watch['rating'].toDouble() : 0.0,
//             minRating: 0,
//             direction: Axis.horizontal,
//             allowHalfRating: true,
//             itemCount: 5,
//             itemSize: 30,
//             itemBuilder: (context, _) => Icon(
//               Icons.star,
//               color: Colors.amber,
//             ),
//             onRatingUpdate: (rating) {
//               // Handle rating updates here if needed
//             },
//           ),
//           SizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Center the input fields
//             children: [
//               DropdownButton<String>(
//                 value: selectedSize,
//                 hint: Text('Select Size'),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedSize = newValue;
//                   });
//                 },
//                 items: <String>['S', 'M', 'L', 'XL']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               DropdownButton<String>(
//                 value: selectedColor,
//                 hint: Text('Select Color'),
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     selectedColor = newValue;
//                   });
//                 },
//                 items: <String>['Red', 'Blue', 'Green', 'Black']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               DropdownButton<int>(
//                 value: selectedQuantity,
//                 hint: Text('Select Quantity'),
//                 onChanged: (int? newValue) {
//                   setState(() {
//                     selectedQuantity = newValue;
//                   });
//                 },
//                 items: <int>[1, 2, 3, 4, 5]
//                     .map<DropdownMenuItem<int>>((int value) {
//                   return DropdownMenuItem<int>(
//                     value: value,
//                     child: Text(value.toString()),
//                   );
//                 }).toList(),
//               ),
//             ],
//           ),
//           SizedBox(height: 20),
//           Container(
//             width: double.infinity, // Take the full width of the screen
//             child: ElevatedButton(
//               onPressed: _addToCart,
//               child: Text(
//                 'Add to Cart',
//                 style: TextStyle(color: Colors.white),
//               ),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }
// }
