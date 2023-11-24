import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectking/WatchDetailsScreen.dart';
import 'package:projectking/cartPage.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> product;
     // final Map<String, String> colorImageMapWatch1;
  //  final Map<String, String> colorImageMapWatch2;
  //   final Map<String, String> colorImageMapWatch3;
  final Map<String, String> colorOptions;

  ProductDetailsScreen({required this.product,
  // required this.colorImageMapWatch1,required this. colorImageMapWatch2,required this. colorImageMapWatch3,
  required this.colorOptions});
  // List<Map<String, dynamic>> ourwatch = [
  //   {"image": "asset/watch 7.jpg", "name": "watch 7", "rating": 4.5},
  //   {"image": "asset/watch 8.jpg", "name": "watch 8", "rating": 3.5},
  //   {"image": "asset/watch 9.jpg", "name": "watch 9", "rating": 5.5},
  //   {"image": "asset/watch 10.jpg", "name": "watch 10", "rating": 6.5},
  //   {"image": "asset/watch 11.jpg", "name": "watch 11", "rating": 7.5},
  //   {"image": "asset/watch 12.jpg", "name": "watch 12", "rating": 5.5},
  // ];
 // Define colorImageMap as a class-level variable
  // Map<String, List<String>> colorImageMap = {
  //   'Red': [
  //     'asset/watch 1.jpg', // Red color image for watch 1
  //     'asset/watch 2.jpg', // Red color image for watch 2
  //     'asset/watch 3.jpg', // Red color image for watch 3
  //   ],
  //   'Blue': [
  //     'asset/watch 4.jpg', // Blue color image for watch 1
  //     'asset/watch 5.jpg', // Blue color image for watch 2
  //     'asset/watch 6.jpg', // Blue color image for watch 3
  //   ],
  //   'Green': [
  //     'asset/watch 7.jpg', // Green color image for watch 1
  //     'asset/watch 8.jpg', // Green color image for watch 2
  //     'asset/watch 9.jpg', // Green color image for watch 3
  //   ],
  //   'Yellow': [
  //     'asset/watch 10.jpg', // Yellow color image for watch 1
  //     'asset/watch 11.jpg', // Yellow color image for watch 2
  //     'asset/watch 12.jpg', // Yellow color image for watch 3
  //   ],
  // };
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Map<String, String>> ColorOptions = [
  {
    'Red': 'asset/watches 1red.jpg',
    'Blue': 'asset/watches 1blue.jpg',
    'Green': 'asset/watches 1green.jpg',
    'Yellow': 'asset/watches 1yellow.jpg',
  },
  {
    'Red': 'asset/watches 2red.jpg',
    'Blue': 'asset/watches 2blue.jpg',
    'Green': 'asset/watches 2green.jpg',
    'Yellow': 'asset/watches 2yellow.jpg',
  },
  {
    'Red': 'asset/watches 3red.jpg',
    'Blue': 'asset/watches 3blue.jpg',
    'Green': 'asset/watches 3green.jpg',
    'Yellow': 'asset/watches 3yellow.jpg',
  },
   {
    'Red': 'asset/watch 3red.jpg',
    'Blue': 'asset/watch 3blue.jpg',
    'Green': 'asset/watch 3green.jpg',
    'Yellow': 'asset/watch 3yellow.jpg',
  }, {
    'Red': 'asset/watch 4red.jpg',
    'Blue': 'asset/watch 4blue.jpg',
    'Green': 'asset/watch 4green.jpg',
    'Yellow': 'asset/watch 4yellow.jpg',
  }, {
    'Red': 'asset/klovnsred.jpg',
    'Blue': 'asset/klovnsblue.jpg',
    'Green': 'asset/klovnsgreen.jpg',
    'Yellow': 'asset/klovnsyellow.jpg',
  }, {
    'Red': 'asset/wrongred.jpg',
    'Blue': 'asset/wrongblue.jpg',
    'Green': 'asset/wronggreen.jpg',
    'Yellow': 'asset/wrongyellow.jpg',
  }, {
    'Red': 'asset/goldred.jpg',
    'Blue': 'asset/goldblue.jpg',
    'Green': 'asset/goldgreen.jpg',
    'Yellow': 'asset/goldyellow.jpg',
  }, {
    'Red': 'asset/reflexred.jpg',
    'Blue': 'asset/reflexblue.jpg',
    'Green': 'asset/reflexgreen.jpg',
    'Yellow': 'asset/reflexyelloew.jpg',
  }, {
    'Red': 'asset/goldred.jpg',
    'Blue': 'asset/goldblue.jpg',
    'Green': 'asset/goldgreen.jpg',
    'Yellow': 'asset/goldyellow.jpg',
  },
  {
    'Red': 'asset/blackgearred.jpg',
    'Blue': 'asset/blackgearblue.jpg',
    'Green': 'asset/blackgeargreen.jpg',
    'Yellow': 'asset/blackgearyellow.jpg',
  },
    
  // Add more watches with their color options as needed.
];

//  Map<String, List<String>> colorImageMap = {
//   'Red': ['asset/watch 3.jpg', 'asset/watch 10.jpg', 'asset/watch 7.jpg', 'asset/watch 14.jpg'],
//   'Blue': ['asset/watch 1.jpg', 'asset/watch 2.jpg', 'asset/watch 3.jpg', 'asset/watch 4.jpg'],
//   'Green': ['asset/watch 5.jpg', 'asset/watch 6.jpg', 'asset/watch 7.jpg', 'asset/watch 8.jpg'],
//   // Add more entries for other colors as needed.
// };

//    Map<String, String> colorImageMapWatch1 = {
//   'Red': 'asset/watch 1red1.jpg',
//   'Blue': 'asset/watch 1blue1.jpg',
//   'Green': 'asset/watch 1.jpg',
//   'Yellow': 'asset/watch 1yellow1.jpg',
// };
// Map<String, String> colorImageMapWatch2 = {
//   'Red': 'asset/watch 1.jpg',
//   'Blue': 'asset/watch 2.jpg',
//   'Green': 'asset/watch 3.jpg',
//   'Yellow': 'asset/watch 4.jpg',
// };

// Map<String, String> colorImageMapWatch3 = {
//   'Red': 'asset/watch 5.jpg',
//   'Blue': 'asset/watch 6.jpg',
//   'Green': 'asset/watch 7.jpg',
//   'Yellow': 'asset/watch 8.jpg',
// };

  // Map<String, List<String>> colorImageMap = {
  //   'Red': [
  //     'asset/watch 1.jpg', // Red color image for watch 1
  //     'asset/watch 2.jpg', // Red color image for watch 2
  //     'asset/watch 3.jpg', // Red color image for watch 3
  //   ],
  //   'Blue': [
  //     'asset/watch 4.jpg', // Blue color image for watch 1
  //     'asset/watch 5.jpg', // Blue color image for watch 2
  //     'asset/watch 6.jpg', // Blue color image for watch 3
  //   ],
  //   'Green': [
  //     'asset/watch 7.jpg', // Green color image for watch 1
  //     'asset/watch 8.jpg', // Green color image for watch 2
  //     'asset/watch 9.jpg', // Green color image for watch 3
  //   ],
  //   'Yellow': [
  //     'asset/watch 10.jpg', // Yellow color image for watch 1
  //     'asset/watch 11.jpg', // Yellow color image for watch 2
  //     'asset/watch 12.jpg', // Yellow color image for watch 3
  //   ],
  // };

  String? selectedSize;

  int? selectedQuantity;
  
   String selectedColor = ''; // Store the selected color here
  late String selectedImageUrl;

  void _buyNow() async {
    if (selectedSize != null &&
        selectedColor != null &&
        selectedQuantity != null) {
      final CollectionReference products =
          FirebaseFirestore.instance.collection('products');
double starRating = widget.product['rating'];
      await products.add({
        'name': widget.product['name'],
        'size': selectedSize,
        'color': selectedColor,
        'quantity': selectedQuantity,
        'price': widget.product['price'],
        'starRating': starRating,
      });
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                CartPage1()), // Replace CheckoutScreen with your actual screen
      );

      final QuerySnapshot cartQuery =
          await FirebaseFirestore.instance.collection('cart').get();
      int currentCartCount = cartQuery.docs.length;

      // Increment the cart count
      currentCartCount++;

      // Update the cart count in Firestore
      await FirebaseFirestore.instance
          .collection('cart')
          .doc('cart_count')
          .set({
        'count': currentCartCount,
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Items submitted to Firestore!')));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please select size, color, and quantity.')));
    }
  }

  bool isFavorite = false;
  void _toggleFavorite() async{
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite status
    });
    
  if (isFavorite) {
    // Add the watch details to Firestore as a favorite
    await FirebaseFirestore.instance.collection('favorites').add({
      'name': widget.product['name'],
      'price': widget.product['price'],
      'image': widget.product['image'],
      'rating': widget.product['rating'],
      // Add any other relevant data you want to store
    });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added to Favorites')));
  } else {
    // Remove the watch details from Firestore if it was unfavorited
    // You would need to implement a mechanism to uniquely identify the watch, e.g., by document ID or some other unique identifier
    // You can use a query to find and delete the watch by its unique identifier
    // Example: await FirebaseFirestore.instance.collection('favorites').where('name', isEqualTo: widget.product['name']).get().then((querySnapshot) {
    //   querySnapshot.docs.forEach((doc) {
    //     doc.reference.delete();
    //   });
    // });

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Removed from Favorites')));
  }
  }

  List<Map<String, dynamic>> similarProducts = [];

  // Function to fetch similar products from Firestore
  Future<void> fetchSimilarProducts() async {
    final firestore = FirebaseFirestore.instance;
    final similarProductsCollection = firestore.collection('similar_products');

    try {
      final querySnapshot = await similarProductsCollection.get();

      List<Map<String, dynamic>> products = [];

      for (final doc in querySnapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        products.add(data);
      }

      setState(() {
        similarProducts = products;
      });
    } catch (error) {
      print('Error fetching similar products: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    final colorKeys = widget.colorOptions.keys.toList();
    selectedColor = colorKeys.isNotEmpty ? colorKeys[0] : '';
    selectedImageUrl = widget.colorOptions[selectedColor] ?? '';
  
    fetchWatchesFromFirestore().then((watchList) {
      setState(() {
        watches = watchList;
      });
    });
    // Fetch similar products from Firestore when the widget initializes
    fetchSimilarProducts();
  }

  List<Map<String, dynamic>> watches = [];

  Future<List<Map<String, dynamic>>> fetchWatchesFromFirestore() async {
    List<Map<String, dynamic>> watches = [];

    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('watches').get();

      for (final doc in snapshot.docs) {
        watches.add({
          'name': doc['name'],
          'price': doc['price'],
          'image_url': doc['image_url'],
        });
      }
    } catch (e) {
      print("Error fetching watches from Firestore: $e");
    }

    return watches;
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
// Map<String, String> colorImageMapWatch1 = {
//   'Red': 'asset/watch 1red1.jpg',
//   'Blue': 'asset/watch 1blue1.jpg',
//   'Green': 'asset/watch 1.jpg',
//   'Yellow': 'asset/watch 1yellow1.jpg',
// };
// Map<String, String> colorImageMapWatch2 = {
//   'Red': 'asset/watch 1.jpg',
//   'Blue': 'asset/watch 2.jpg',
//   'Green': 'asset/watch 3.jpg',
//   'Yellow': 'asset/watch 4.jpg',
// };

// Map<String, String> colorImageMapWatch3 = {
//   'Red': 'asset/watch 5.jpg',
//   'Blue': 'asset/watch 6.jpg',
//   'Green': 'asset/watch 7.jpg',
//   'Yellow': 'asset/watch 8.jpg',
// };

// Map<String, String> colorImageMap = {
//   'Red': 'asset/watch 1red1.jpg',
//   'Blue': 'asset/watch 1blue1.jpg',
//   'Green': 'asset/watch 1.jpg',
//   'Yellow': 'asset/watch 1yellow1.jpg',
// };
//  Map<int, List<String>> colorImageMap = {
//   0: ['asset/watch 9.jpg', 'asset/watch 10.jpg', 'asset/watch 7.jpg', 'asset/watch 14.jpg'],
//   1: ['asset/watch 1.jpg', 'asset/watch 2.jpg', 'asset/watch 3.jpg', 'asset/watch 4.jpg'],
//   2: ['asset/watch 5.jpg', 'asset/watch 6.jpg', 'asset/watch 7.jpg', 'asset/watch 8.jpg'],
//   // Add more entries for other watches as needed.
// };
// final Map<String, List<String>> colorOptions = {
//   'Red': ['asset/watch 1.jpg', 'asset/watch 5.jpg', 'asset/watch 9.jpg'],
//   'Blue': ['asset/watch 2.jpg', 'asset/watch 6.jpg', 'asset/watch 10.jpg'],
//   'Green': ['asset/watch 3.jpg', 'asset/watch 7.jpg', 'asset/watch 11.jpg'],
//   'Yellow': ['asset/watch 4.jpg', 'asset/watch 8.jpg', 'asset/watch 12.jpg'],
// };
// final Map<String, List<String>> colorOptions = {
//   'Red': [
//     'asset/watch 1.jpg', // Red color image for watch 1
//     'asset/watch 2jpg', // Red color image for watch 2
//     'asset/watch 3.jpg', // Red color image for watch 3
//   ],
//   'Blue': [
//     'asset/watch 4.jpg', // Blue color image for watch 1
//     'asset/watch 5.jpg', // Blue color image for watch 2
//     'asset/watch 6.jpg', // Blue color image for watch 3
//   ],
//   'Green': [
//     'asset/watch 7.jpg', // Green color image for watch 1
//     'asset/watch 8.jpg', // Green color image for watch 2
//     'asset/watch 9.jpg', // Green color image for watch 3
//   ],
//   // Add similar entries for other colors as needed
// };

// List<String>? getColorImageUrls(String selectedColor) {
//   return colorOptions[selectedColor];
// }
//  void updateSelectedImage(String color) {
//     setState(() {
//       selectedImageUrl = colorImageMap[color];
//     });
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product['name']), actions: <Widget>[
        IconButton(
          icon: AnimatedContainer(
            duration: Duration(milliseconds: 300), // Animation duration
            child: Icon(
              Icons.favorite,
              color: isFavorite
                  ? Colors.red
                  : null, // Set color to red if it's a favorite
            ),
          ),
          onPressed:
              _toggleFavorite, // Toggle the favorite status on button press
        ),
        StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('cart').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              print('No data received');
              return IconButton(
                onPressed: () {
                  // Navigate to the cart page when the cart icon is clicked.
                },
                icon: Icon(Icons.shopping_cart),
              );
            }

            final cartItems = snapshot.data!.docs;
            int cartItemCount = 0;

            for (var cartItem in cartItems) {
              var data = cartItem.data() as Map<String, dynamic>?;

              if (data != null) {
                var quantity = data['quantity'] as int?;
                if (quantity != null) {
                  cartItemCount += quantity;
                }
              }
            }

            print('Cart count: $cartItemCount'); // Add this debug print

            return Stack(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage1()),
                    );
                    // Navigate to the cart page when the cart icon is clicked.
                  },
                  icon: Icon(Icons.shopping_cart),
                ),
                if (cartItemCount > 0)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 10,
                      child: Text(
                        cartItemCount.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Text("Selected Color: $selectedColor"),
          Image.asset(selectedImageUrl), 
//             Container(
//   height: 200,
//   decoration: BoxDecoration(
//     image: selectedImageUrl != null
//         ? DecorationImage(
//             image: AssetImage(selectedImageUrl!),
//             fit: BoxFit.cover,
//           )
//         : null,
//   ),
// ),
            // Image.asset(
            //   widget.product['image'],
            //   fit: BoxFit.cover,
            // ),
            // SizedBox(height: 10),
            
            Text(
              widget.product['name'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rs ' + widget.product['price'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating:
                  widget.product['rating'], // Use the rating from your data
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
                // You can handle rating updates here if needed
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                
//                 DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//       final imageUrls = getColorImageUrls(selectedColor);
//       if (imageUrls != null && imageUrls.isNotEmpty) {
//         selectedImageUrl = imageUrls[0]; // Use the first image URL by default
//       } else {
//         selectedImageUrl = null; // Handle the case where no image URLs are found
//       }
//     });
//   },
//   items: colorOptions.keys.map((String color) {
//     return DropdownMenuItem<String>(
//       value: color,
//       child: Text(color),
//     );
//   }).toList(),
// ),

//                 DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//       selectedImageUrl = getColorImageUrl(selectedColor,watches[index]);
//     });
//   },
//   items: colorOptions.map((colorImageMap) {
//     return DropdownMenuItem<String>(
//       value: colorImageMap.keys.first, // Use the color as the value
//       child: Text(colorImageMap.keys.first),
//     );
//   }).toList(),
// ),

//                 DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//       selectedImageUrl = colorImageMapWatch1[selectedColor]; 
//       selectedImageUrl = colorImageMapWatch2[selectedColor]; 
//       selectedImageUrl = colorImageMapWatch3[selectedColor]; // Retrieve the image from the map
//     });
//   },
//   items: colorImageMapWatch1keys.map((String color) {
//     return DropdownMenuItem<String>(
//       value: color,
//       child: Text(color),
//     );
//   }).toList(),
// ),
// DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//       final imageUrls = colorImageMap[selectedColor];
      
//       if (imageUrls != null && imageUrls.isNotEmpty) {
//         selectedImageUrl = imageUrls[0]; // Use the first image URL by default
//       } else {
//         selectedImageUrl = null; // Handle the case where no image URLs are found
//       }
//     });
//   },
//   items: colorImageMap.keys.map((String color) {
//     return DropdownMenuItem<String>(
//       value: color,
//       child: Text(color),
//     );
//   }).toList(),
// ),

// DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//       final imageUrls = colorImageMap[selectedColor];
      
//       if (imageUrls != null && imageUrls.isNotEmpty) {
//         selectedImageUrl = imageUrls[0]; // Use the first image URL by default
//       } else {
//         selectedImageUrl = null; // Handle the case where no image URLs are found
//       }
//     });
//   },
  //               DropdownButton<String>(
  // value: selectedColor,
  // onChanged: (String? newValue) {
  //   setState(() {
  //     selectedColor = newValue!;
  //     selectedImageUrl = colorOptions[selectedColor];
  //   });
  // },       
//                 DropdownButton<String>(
//   value: selectedColor,
//   onChanged: (String? newValue) {
//     setState(() {
//       selectedColor = newValue!;
//     });
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

  // items: ['Red', 'Blue', 'Green', 'Yellow'].map((String color) {
  //   return DropdownMenuItem<String>(
  //     value: color,
  //     child: Text(color),
  //   );
  // }).toList(),
                
 Container(
      width: 20,
      height: 20,
      color: getWatchColor(selectedColor),
    ), 

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
            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _buyNow,
                child: Text(
                  'Add to Cart',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Similar Products', style: TextStyle(fontSize: 14)),
            SizedBox(height: 10),
            Container(
              height: 200,

              child: Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: watches.length,
                  itemBuilder: (BuildContext context, int index) {
                  return InkWell( // Wrap with InkWell for tap effect
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WatchDetailsScreen(
              watch: watches[index],colorOptions: ColorOptions[index] // Pass the watch details to WatchDetailsScreen
            ),
          ),
        );
      },           child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(watches[index]['image_url'],
                                height: 100), // Use 'image_url' from Firestore
                            SizedBox(height: 5),
                            Text(watches[index]['name']),
                            SizedBox(height: 5),
                            Text('Rs ${watches[index]['price']}'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
                     )
          ],
        ),
      ),
    );
  }
}
