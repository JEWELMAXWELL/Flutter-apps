import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectking/WatchDetailsScreen.dart';
import 'package:projectking/cartPage.dart';



class ProductDetailsScreen2 extends StatefulWidget {
  final Map<String, dynamic> product;
final Map<String, String> colorOptions;
  ProductDetailsScreen2({required this.product,required this.colorOptions});
 List<Map<String, dynamic>> ourswatch = [
    {"image": "asset/watch 12.jpg", "name": "ANDROID WATCH", "price": "500","rating": 4.5},
    {"image": "asset/watch 13.jpg", "name": "APPLE WATCH", "price": "800","rating": 8.5},
    {"image": "asset/watch 14.jpg", "name": "WRIST BAND", "price": "900","rating": 5.5},
    {"image": "asset/watch 15.jpg", "name": "SIMPLE SMART WATCH", "price": "1200","rating": 7.5},
    {"image": "asset/watch 16.jpg", "name": "GEAR WATCH", "price": "1700","rating": 3.5},
    {"image": "asset/watch 17.jpg", "name": "SIMPLE WATCH", "price": "2300","rating": 9.5},
  ]; 
  
  

  @override
  _ProductDetailsScreen2State createState() => _ProductDetailsScreen2State();
}

class _ProductDetailsScreen2State extends State<ProductDetailsScreen2> {
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
  String? selectedSize;
  // String? selectedColor;
  int? selectedQuantity;
String selectedColor = ''; 
late String selectedImageUrl;
  void _buyNow() async {
    if (selectedSize != null && selectedColor != null && selectedQuantity != null) {
      final CollectionReference products = FirebaseFirestore.instance.collection('products');

      await products.add({
        'name': widget.product['name'],
        'size': selectedSize,
        'color': selectedColor,
        'quantity': selectedQuantity,
        'price': widget.product['price'], 
      });
      Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CartPage1()), // Replace CheckoutScreen with your actual screen
    );

     final QuerySnapshot cartQuery = await FirebaseFirestore.instance.collection('cart').get();
    int currentCartCount = cartQuery.docs.length;

    // Increment the cart count
    currentCartCount++;

    // Update the cart count in Firestore
    await FirebaseFirestore.instance.collection('cart').doc('cart_count').set({
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
    void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; // Toggle the favorite status
    });
  }

  int starRating = 0; // Initialize the star rating to 0.

  // Function to handle star rating changes.
  void _onStarRatingChanged(int rating) {
    setState(() {
      starRating = rating;
    });
  }
   List<Map<String, dynamic>> watches = [];

  Future<List<Map<String, dynamic>>> fetchWatchesFromFirestore() async {
    List<Map<String, dynamic>> watches = [];

    try {
      final snapshot = await FirebaseFirestore.instance.collection('watches').get();
    
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
        title: Text(widget.product['name']),
        actions: <Widget>[
           IconButton(
            icon: AnimatedContainer(
              duration: Duration(milliseconds: 300), // Animation duration
              child: Icon(
                Icons.favorite,
                color: isFavorite ? Colors.red : null, // Set color to red if it's a favorite
              ),
            ),
            onPressed: _toggleFavorite, // Toggle the favorite status on button press
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
            // Image.asset(
            //   widget.product['image'],
            //   fit: BoxFit.cover,
            // ),
            SizedBox(height: 10),
            Text(
              widget.product['name'],
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            Text(
              'Rs ' + widget.product['price'],
              style: TextStyle(fontSize: 20),
            ),
             SizedBox(height: 10),
            // Star Rating Widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: starRating >= 1 ? Colors.yellow : Colors.grey),
                Icon(Icons.star, color: starRating >= 2 ? Colors.yellow : Colors.grey),
                Icon(Icons.star, color: starRating >= 3 ? Colors.yellow : Colors.grey),
                Icon(Icons.star, color: starRating >= 4 ? Colors.yellow : Colors.grey),
                Icon(Icons.star, color: starRating >= 5 ? Colors.yellow : Colors.grey),
              ],
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
              height: 300,
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
              watch: watches[index],colorOptions: ColorOptions[index]// Pass the watch details to WatchDetailsScreen
            ),
          ),);},
                    // return GestureDetector(
                    //   onTap: () {
                    //     // Navigate to watch details page for the selected watch
                    //   },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(watches[index]['image_url'], height: 100), // Using 'image_url' from Firestore
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
         ),
     
      ]),
    ));
  }
}

         






































