// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:projectking/model.dart';

// class ProductProvider with ChangeNotifier {
//   List<CartItem> checkOutModelList = [];
//   CartItem checkOutModel;

//   void deleteCheckoutProduct(int index) {
//     checkOutModelList.removeAt(index);
//     notifyListeners();
//   }

//   void clearCheckoutProduct() {
//     checkOutModelList.clear();
//     notifyListeners();
//   }

//   void getCheckOutData({
//     int quantity,
//     double price,
//     String name,
//     String color,
//     String size,
//     String image,
//   }) {
//     checkOutModel = CartItem(
//       productId: name, // Assuming 'name' is the productId
//       color: color,
//       size: size,
//       quantity: quantity,
//     );
//     checkOutModelList.add(checkOutModel);
//   }

//   List<CartItem> get getCheckOutModelList {
//     return List.from(checkOutModelList);
//   }

//   int get getCheckOutModelListLength {
//     return checkOutModelList.length;
//   }
// }

// class ProductDetailsScreen extends StatefulWidget {
//   final Map<String, dynamic> product;

//   ProductDetailsScreen({required this.product});

//   @override
//   _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
// }

// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   String? selectedSizeValue;
//   String? selectedColorValue;
//   int? selectedQuantityValue;

//   int cartItemCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.product['name']),
//         actions: <Widget>[
//           IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
//           StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance.collection('cart').snapshots(),
//             builder: (context, snapshot) {
//               if (!snapshot.hasData) {
//                 return IconButton(
//                   onPressed: () {
//                     // Navigate to the cart page when the cart icon is clicked.
//                   },
//                   icon: Icon(Icons.shopping_cart),
//                 );
//               }

//               final cartItems = snapshot.data!.docs;
//               cartItemCount = 0;

//               for (var cartItem in cartItems) {
//                 var data = cartItem.data() as Map<String, dynamic>?;

//                 if (data != null) {
//                   var quantity = data['quantity'] as int?;
//                   if (quantity != null) {
//                     cartItemCount += quantity;
//                   }
//                 }
//               }

//               return Stack(
//                 children: [
//                   IconButton(
//                     onPressed: () {
//                       // Navigate to the cart page when the cart icon is clicked.
//                     },
//                     icon: Icon(Icons.shopping_cart),
//                   ),
//                   if (cartItemCount > 0)
//                     Positioned(
//                       right: 0,
//                       top: 0,
//                       child: CircleAvatar(
//                         backgroundColor: Colors.red,
//                         radius: 10,
//                         child: Text(
//                           cartItemCount.toString(),
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               widget.product['image'],
//               fit: BoxFit.cover,
//             ),
//             SizedBox(height: 10),
//             Text(widget.product['name'], style: TextStyle(fontSize: 20)),
//             SizedBox(height: 10),
//             Text('Rs ' + widget.product['price'], style: TextStyle(fontSize: 20)),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 DropdownButton<String>(
//                   items: <String>['S', 'M', 'L', 'XL'].map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedSizeValue = newValue; // Update selected size.
//                     });
//                   },
//                   hint: Text('Size'),
//                 ),
//                 DropdownButton<String>(
//                   items: <String>['Red', 'Blue', 'Green', 'Black']
//                       .map((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(value),
//                     );
//                   }).toList(),
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       selectedColorValue = newValue; // Update selected color.
//                     });
//                   },
//                   hint: Text('Color'),
//                 ),
//                 DropdownButton<int>(
//                   items: <int>[1, 2, 3, 4, 5].map((int value) {
//                     return DropdownMenuItem<int>(
//                       value: value,
//                       child: Text(value.toString()),
//                     );
//                   }).toList(),
//                   onChanged: (int? newValue) {
//                     setState(() {
//                       selectedQuantityValue = newValue; // Update selected quantity.
//                     });
//                   },
//                   hint: Text('Quantity'),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   final productId = widget.product['productId'];
//                   final selectedSizeValue = selectedSize;
//                   final selectedColorValue = selectedColor;
//                   final selectedQuantityValue = selectedQuantity;

//                   if (productId != null &&
//                       selectedSizeValue != null &&
//                       selectedColorValue != null &&
//                       selectedQuantityValue != null) {
//                     final cartItem = CartItem(
//                       productId: productId,
//                       size: selectedSizeValue,
//                       color: selectedColorValue,
//                       quantity: selectedQuantityValue,
//                     );
//                     await FirebaseFirestore.instance.collection('cart').add({
//                       'productId': cartItem.productId,
//                       'size': cartItem.size,
//                       'color': cartItem.color,
//                       'quantity': cartItem.quantity,
//                     });
//                   }
//                 },
//                 child: Text('Buy Now'),
//               ),
//             ),
//             SizedBox(height: 20),
//             Text('Similar Products', style: TextStyle(fontSize: 14)),
//             SizedBox(height: 10),
//             Container(
//               height: 200,
//               child: GridView.builder(
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   mainAxisSpacing: 10,
//                   mainAxisExtent: 180,
//                   crossAxisSpacing: 10,
//                 ),
//                 itemCount: 4,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Image.asset(
//                     widget.ourwatch[index]['image'],
//                     fit: BoxFit.cover,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }





















// // import 'package:flutter/material.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:projectking/model.dart';
// // class CartItem {
// //   final String productId;
// //   final String size;
// //   final String color;
// //   final int quantity;

// //   CartItem({
// //     required this.productId,
// //     required this.size,
// //     required this.color,
// //     required this.quantity,
// //   });
// // }
  
// //   // ProductDetailsScreen({required this.product});


// // class ProductDetailsScreen extends StatefulWidget {
// // List<Map<String, dynamic>> ourwatch = [
// //     {"image": "asset/watch 7.jpg", "name": "watch 7"},
// //     {"image": "asset/watch 8.jpg", "name": "watch 8"},
// //     {"image": "asset/watch 9.jpg", "name": "watch 9"},
// //     {"image": "asset/watch 10.jpg", "name": "watch 10"},
// //     {"image": "asset/watch 11.jpg", "name": "watch 11"},
// //     {"image": "asset/watch 12.jpg", "name": "watch 12"},
// //   ];
  
// //   int cartItemCount = 0; 
// //   final Map<String, dynamic> product;
  
// //   ProductDetailsScreen({required this.product});


// // @override
// //   _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
// // }  
// // class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
// //  String? selectedSizeValue;  // Holds the selected size.
// // String? selectedColorValue; // Holds the selected color.
// // int? selectedQuantityValue;
// //  String? selectedSize;  // Holds the selected size.
// //   String? selectedColor; // Holds the selected color.
// //   int? selectedQuantity; // Holds the selected quantity.
// //  int cartItemCount = 0; 
// //   @override
// //   Widget build(BuildContext context) {
// //     var product;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.product['name']),

// //         // title: Text(product['name']),
// //         actions: <Widget>[
// //           IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
// //           StreamBuilder<QuerySnapshot>(
// //   stream: FirebaseFirestore.instance.collection('cart').snapshots(),
// //   builder: (context, snapshot) {
// //     if (!snapshot.hasData) {
// //       return IconButton(
// //         onPressed: () {
// //           // Navigate to the cart page when the cart icon is clicked.
// //         },
// //         icon: Icon(Icons.shopping_cart),
// //       );
// //     }
    
// //               final cartItems = snapshot.data!.docs;
// //                cartItemCount = 0;

// //     for (var cartItem in cartItems) {
// //   var data = cartItem.data() as Map<String, dynamic>?;

// //   if (data != null) {
// //     var quantity = data['quantity'] as int?;
// //     if (quantity != null) {
// //       cartItemCount += quantity;
// //     }
// //   }
// // }


// // //     for (var cartItem in cartItems) {
// // //   var data = cartItem.data();
// // //   var quantity = data?['quantity'] as int? ?? 0;
// // //   cartItemCount += quantity;
// // // }

// //     // for (var cartItem in cartItems) {
// //     //   cartItemCount += cartItem.data()['quantity'] as int;
// //     // }

// //     return Stack(
// //       children: [
// //         IconButton(
// //           onPressed: () {
// //             // Navigate to the cart page when the cart icon is clicked.
// //           },
// //           icon: Icon(Icons.shopping_cart),
// //         ),
// //         if (cartItemCount > 0)
// //           Positioned(
// //             right: 0,
// //             top: 0,
// //             child: CircleAvatar(
// //               backgroundColor: Colors.red,
// //               radius: 10,
// //               child: Text(
// //                 cartItemCount.toString(),
// //                 style: TextStyle(color: Colors.white),
// //               ),
// //             ),
// //           ),
// //       ],
// //     );
// //   },
// // )

// //           // IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: [
// //             Image.asset(
// //               widget.product['image'],
// //               fit: BoxFit.cover,
// //             ),
// //             SizedBox(height: 10),
// //             Text(widget.product['name'], style: TextStyle(fontSize: 20)),
// //             SizedBox(height: 10),
// //             Text('Rs ' + widget.product['price'], style: TextStyle(fontSize: 20)),
// //             SizedBox(height: 20),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 DropdownButton<String>(
// //                   items: <String>['S', 'M', 'L', 'XL'].map((String value) {
// //                     return DropdownMenuItem<String>(
// //                       value: value,
// //                       child: Text(value),
// //                     );
// //                   }).toList(),
// //                   onChanged: (String? newValue) {
// //                     setState(() {
// //       selectedSizeValue = newValue; // Update selected size.
// //     });
// //                     // Handle onChanged event
// //                   },
// //                   hint: Text('Size'),
// //                 ),
// //                 DropdownButton<String>(
// //                   items: <String>['Red', 'Blue', 'Green', 'Black']
// //                       .map((String value) {
// //                     return DropdownMenuItem<String>(
// //                       value: value,
// //                       child: Text(value),
// //                     );
// //                   }).toList(),
// //                   onChanged: (String? newValue) {
// //                     setState(() {
// //       selectedColorValue = newValue; // Update selected quantity.
// //     });
// //                     // Handle onChanged event
// //                   },
// //                   hint: Text('Color'),
// //                 ),
// //                 DropdownButton<int>(
// //                   items: <int>[1, 2, 3, 4, 5].map((int value) {
// //                     return DropdownMenuItem<int>(
// //                       value: value,
// //                       child: Text(value.toString()),
// //                     );
// //                   }).toList(),
// //                   onChanged: (int? newValue) {
// //                     setState(() {
// //       selectedQuantityValue = newValue; // Update selected quantity.
// //     });
// //                     // Handle onChanged event
// //                   },
// //                   hint: Text('Quantity'),
// //                 ),
// //               ],
// //             ),
// //            SizedBox(height: 20),
// //             Container(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: () async{
// //                   final productId = widget.product['productId']; 
// //     final selectedSizeValue = selectedSize; 
// //     final selectedColorValue = selectedColor; 
// //     final selectedQuantityValue = selectedQuantity; 

// //     if (productId != null && selectedSizeValue != null && selectedColorValue != null && selectedQuantityValue != null) {

// //                 final cartItem = CartItem(
// //                 productId: product['watch 1'], 
// //                 size: selectedSizeValue,
// //                 color: selectedColorValue,
// //                 quantity:selectedQuantityValue,
// //     );
// //     await FirebaseFirestore.instance.collection('cart').add({
// //       'productId': cartItem.productId,
// //       'size': cartItem.size,
// //       'color': cartItem.color,
// //       'quantity': cartItem.quantity,
// //     });

    
                
// //                 ElevatedButton.styleFrom(backgroundColor: Colors.red);
// //                 Text('Buy Now');
// //   }}, child: null,),
// //             ),
// //              SizedBox(height: 20),
// //             Text('Similar Products', style: TextStyle(fontSize: 14)),
// //             SizedBox(height: 10),
// //             Container(
// //               height: 200,
// //               child: GridView.builder(
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 2,
// //                   mainAxisSpacing: 10,
// //                   mainAxisExtent: 180,
// //                   crossAxisSpacing: 10,
// //                 ),
// //                 itemCount: 4,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   return Image.asset(widget.ourwatch[index]['image'], // Load images based on mywatch list
// //       fit: BoxFit.cover,
    
                
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
