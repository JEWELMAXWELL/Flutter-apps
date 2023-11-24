import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectking/payment.dart';

class CartPage1 extends StatefulWidget {
  @override
  _CartPage1State createState() => _CartPage1State();
}

class _CartPage1State extends State<CartPage1> {
  int cartItemCount = 0;
int totalCartPrice = 0;
 bool isCartCleared = false;
  @override
  void initState() {
    super.initState();
    updateCartItemCount(); 
    calculateTotalCartPrice();// Initialize cart item count
  }

  void updateCartItemCount() async {
    final QuerySnapshot cartQuery = await FirebaseFirestore.instance.collection('cart').get();
    setState(() {
      cartItemCount = cartQuery.docs.length;
    });
  }

  void incrementCartItemCount() {
    setState(() {
      cartItemCount++;
    });
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => PaymentPage()), // Navigate to the payment page
  );
  }
 void clearProductsCollection() async {
    final QuerySnapshot productsQuery = await FirebaseFirestore.instance.collection('products').get();
    final batch = FirebaseFirestore.instance.batch();

    // Delete all documents in the "products" collection
    productsQuery.docs.forEach((doc) {
      batch.delete(doc.reference);
    });

    // Commit the batched delete operation
    await batch.commit();
    setState(() {
      isCartCleared = true; // Set the flag to indicate that the cart has been cleared
    });
  }
   void calculateTotalCartPrice() async {
    final QuerySnapshot productsQuery = await FirebaseFirestore.instance.collection('products').get();
    int total = 0;

    // Iterate through cart items and calculate the total price
    productsQuery.docs.forEach((doc) {
    final data = doc.data() as Map<String, dynamic>;
    final price = data['price'] ?? 0; // Ensure price is not null
    final quantity = data['quantity'] ?? 1; // Default quantity to 1 if not specified
    total += (price as int) * (quantity as int); // Calculate the total price for this product
  });


    setState(() {
      totalCartPrice = total;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Items'),
        actions: [
          Stack(
            alignment: Alignment.center,
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
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/watch 1.jpg'), // Replace with your background image asset
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<QuerySnapshot>(
          future: FirebaseFirestore.instance.collection('products').get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(), // Show a loading indicator while data is being fetched.
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List<DocumentSnapshot> documents = snapshot.data!.docs;
              return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final Map<String, dynamic> data = documents[index].data() as Map<String, dynamic>;
                  return Card(
                    elevation: 4, // Add elevation for a shadow effect
                    margin: EdgeInsets.all(8), // Add margin for spacing
                    color: Colors.white70, // Set background color for the card
                    child: ListTile(
                      title: Text(
                        data['name'],
                        style: TextStyle(
                          fontSize: 18, // Adjust font size
                          fontWeight: FontWeight.bold, // Add bold text
                        ),
                      ),
                      subtitle: Column(
                        children: [
                          Text(
                            'Size: ${data['size']}, Color: ${data['color']}, Quantity: ${data['quantity']}',
                            style: TextStyle(
                              fontSize: 16, // Adjust font size
                              fontStyle: FontStyle.italic, // Add italic text
                            ),
                          ),
                          Text(
                            'Price: Rs ${data['price']}',
                            style: TextStyle(
                              fontSize: 16, // Adjust font size
                            ),
                          ),
                           Text(
                    'Star Rating: ${data['starRating']}', // Assuming the key is 'starRating' in Firestore
                    style: TextStyle(
                      fontSize: 16,
                    ),)
                        ],
                      ),
                      trailing: ElevatedButton(
                        onPressed: () {
                          
                          // Implement the Buy Now functionality here
                          // For example, you can add the selected item to the user's cart
                          // and update the cart item count.
                          // For now, we'll just increment the cart item count as a placeholder.
                          incrementCartItemCount();
                           
                       },
                        child: Text('Buy Now'),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the container
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, -3),
            ),
          ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text(
            //   'Total: Rs $totalCartPrice', // Display the calculated total cart price
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                // Clear the "products" collection when "Remove from Cart" is clicked
                clearProductsCollection();
            
                // You can also clear the cart collection if needed
                // For example, you can use a similar batched write operation to delete all documents in the "cart" collection
            
                // Navigate to the payment page as a placeholder
                
              },
              child: Text('Remove from Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

    








