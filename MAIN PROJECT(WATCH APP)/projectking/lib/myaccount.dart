import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectking/favoritestab.dart';
import 'package:projectking/payment.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projectking/watches.dart';
import 'watch.dart';


class MyAccountPage extends StatefulWidget {
  
   final String fullName;
  final String email;
   List<Watch> favoriteWatches;
   String userEmail = '';


  MyAccountPage({required this.fullName, required this.email, required this.favoriteWatches,});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
   TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  int cartItemCount = 0;
//  FirebaseAuth _auth = FirebaseAuth.instance;
//   User? _user; 
  
//   Future<void> _getUserProfile() async {
//     final User? user = _auth.currentUser;

//     if (user != null) {
//       setState(() {
//         _user = user;
//       });
//     }
//   }
  @override
  void initState() {
    super.initState();
    updateCartItemCount();
    loadFavoriteWatches();
    loadUserData();
    //  firstNameController.text = widget.fullName;
     firstNameController.text =   "Jewel";
    lastNameController.text = "Maxwell";
    addressController.text = "Eastfort(po) Thrissur";
    cityController.text = "Thrissur";
    countryController.text = "India";
    phoneNumberController.text = "9074756119";

  }
  Future<void> loadUserData() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      setState(() {
        // Set the userEmail in the widget's state
        widget.userEmail = user.email ?? '';
      });
      final userData = await FirebaseFirestore.instance
          .collection('myaccount')
          .doc(user.uid)
          .get();

      if (userData.exists) {
        final data = userData.data() as Map<String, dynamic>;
        setState(() {
          firstNameController.text = data['firstName'];
          lastNameController.text = data['lastName'];
          addressController.text = data['address'];
          cityController.text = data['city'];
          countryController.text = data['country'];
          phoneNumberController.text = data['phoneNumber'];
        });
      }
    }
  } catch (error) {
    print('Error loading user data: $error');
  }
}
Future<void> updateUserData() async {
  try {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('myaccount').doc(user.uid).set({
        'firstName': firstNameController.text,
        'lastName': lastNameController.text,
        'address': addressController.text,
        'city': cityController.text,
        'country': countryController.text,
        'phoneNumber': phoneNumberController.text,
      });
    }
    print("User data updated successfully");
  } catch (error) {
    print('Error updating user data: $error');
  }
}

  void updateCartItemCount() async {
    final QuerySnapshot cartQuery =
        await FirebaseFirestore.instance.collection('cart').get();
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
      MaterialPageRoute(
          builder: (context) => PaymentPage()), // Navigate to the payment page
    );
  }

  final String name = "Jewel Maxwell";
  final String email = "jewelmaxwell007@gmail.com";
  final String phone = "9074756119";
  final String address = "Eastfort(po) Thrissur";
  final String about = "I love coding and technology!";
  final String Language = "English";
  final String DeliveryAddress = "Eastfort(po) Thrissur";
  final String HelpandSupport = "Get help and support";
bool isEditing = false;

 

  void toggleEditing() {
    setState(() {
      isEditing = !isEditing;
       if (!isEditing) {
        // Reload user data from Firestore here...
        // For now, we'll just reassign the initial values for demonstration purposes
        firstNameController.text = "jewel";
        lastNameController.text = "Maxwell";
        addressController.text = "Eastfort(po) Thrissur";
        cityController.text = "Thrissur";
        countryController.text = "India";
        phoneNumberController.text = "9074756119";
      }
    });
  }
  
  void saveUserData() {
    // Implement logic to save user data here
    // You can update the user's data in Firebase Firestore or any other backend
    // For this example, we'll just print the updated data to the console
     updateUserData();
    print("Updated First Name: ${firstNameController.text}");
    print("Updated Last Name: ${lastNameController.text}");
    print("Updated Address: ${addressController.text}");
    print("Updated City: ${cityController.text}");
    print("Updated Country: ${countryController.text}");
    print("Updated Phone Number: ${phoneNumberController.text}");

    // After saving the data, toggle editing mode off
    toggleEditing();
  }

   void loadFavoriteWatches() async {
    try {
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('favorites').get();

      List<Watch> favoriteWatches = [];

      querySnapshot.docs.forEach((doc) {
        final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

        // Create a Watch object from Firestore data and add it to the list
        favoriteWatches.add(Watch.fromMap(data));
      });

      setState(() {
        widget.favoriteWatches = favoriteWatches;
      });
    } catch (error) {
      // Handle errors here (e.g., no internet connection)
      print('Error loading favorite watches: $error');
    }
  }
  // Function to remove an item from Firestore based on its document ID
Future<void> removeItemFromCollection(String collectionName, String documentId) async {
  try {
    await FirebaseFirestore.instance.collection(collectionName).doc(documentId).delete();
    print('Item removed from $collectionName successfully');
  } catch (error) {
    print('Error removing item from $collectionName: $error');
  }
}

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text("My Account"),
              bottom: TabBar(
                tabs: [
                  Tab(
  icon: Icon(Icons.edit),
  text: 'Edit',
  
  // child: Column(
  //   children: [
  //     Text(widget.fullName, // Display full name from widget property
  //         style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
  //     Text(widget.email, // Display email from widget property
  //         style: TextStyle(fontSize: 8, color: Colors.grey)),
  //     // Add editing fields and logic here
  //   ],
  // ),
),
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: "Favorites",
                  ),
                  
                  Tab(
                    icon: Icon(Icons.favorite),
                    text: "Fav from store",
                  ),
                  Tab(
                    icon: Icon(Icons.shopping_cart),
                    text: "Cart",
                  ),
                  Tab(
                    icon: Icon(Icons.settings),
                    text: "Settings",
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
                     SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
         child:

  

              Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Center(
                   child: Text("JEWEL MAXWELL",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                 ),
                    Center(
                      child: Text(widget.userEmail,
                          style: TextStyle(fontSize: 16, color: Colors.grey)),
                    ),
                  SizedBox(height: 29,),
                
                Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 10,),
                // Last Name
                TextFormField(
                  controller: lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 10),
                // Address
                TextFormField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: "Address",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 10,),
                // City
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(
                    labelText: "City",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 10,),
                // Country
                TextFormField(
                  controller: countryController,
                  decoration: InputDecoration(
                    labelText: "Country",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 10,),
                // Phone Number
                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    enabled: isEditing,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                  ),
                  enabled: isEditing,
                ),SizedBox(height: 7,),SizedBox(height: 10,),
                 
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Toggle editing mode
                        toggleEditing();
                      },
                      child: Text(isEditing ? "Cancel" : "Edit"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (isEditing) {
                          // Save user data if in editing mode
                          updateUserData();
                          

                        }
                      },
                      child: Text(isEditing ? "Save" : "Save"),
                    ),
                  ],
                ),
  ]),
            
              

             ), Center(
                child:// Content for the Favorites tab
                StreamBuilder(
    stream: FirebaseFirestore.instance.collection('favorites').snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) {
        return CircularProgressIndicator();
      }

      final favorites = snapshot.data!.docs;

      return ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index].data() as Map<String, dynamic>;

          return ListTile(
            leading: Image.asset(item['image']),
            title: Text(item['name']),
            subtitle: Text('Price: \$${item['price']}'),
            trailing: Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Rating: ${item['rating']}'),
      ElevatedButton(
        onPressed: () {
          // Remove the item from Firestore collection 'fav of store'
          final documentId = favorites[index].id;
          removeItemFromCollection('favorites', documentId);
        },
        child: Text('Remove'),
      ),
    ],
  ),


          );
        },
      );
    },
  ),
),
Center(
                child: 
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('fav of store').snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        }

                        final favorites = snapshot.data!.docs;

                        return ListView.builder(
                          itemCount: favorites.length,
                          itemBuilder: (context, index) {
                            final item = favorites[index].data() as Map<String, dynamic>;
                             
                             final imageUrl = item['image_url'] as String? ?? 'default_image_url';
                            return ListTile(
                            leading: Image.network(imageUrl),
                              title: Text(item['name']),
                              subtitle: Text('Price: \$${item['price']}'),
                              trailing: ElevatedButton(
                          onPressed: () {
                            // Remove the item from Firestore collection 'fav of store'
                            final documentId = favorites[index].id;
                            removeItemFromCollection('fav of store', documentId);
                          },
                          child: Text('Remove'),
                        ),
                      
                              
                            );
                          },
                        );
                      },
                    ),
                  ),
    ),
              
          

    
                
              

              // Content for the Cart tab
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'asset/watch 1.jpg'), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: FutureBuilder<QuerySnapshot>(
                    future:
                        FirebaseFirestore.instance.collection('products').get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child:
                              CircularProgressIndicator(), 
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('Error: ${snapshot.error}'),
                        );
                      } else {
                        final List<DocumentSnapshot> documents =
                            snapshot.data!.docs;
                        return ListView.builder(
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            final Map<String, dynamic> data =
                                documents[index].data() as Map<String, dynamic>;
                            return Card(
                              elevation: 4, 
                              margin:
                                  EdgeInsets.all(8), 
                              color: Colors
                                  .white70, 
                              child: ListTile(
                                title: Text(
                                  data['name'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight:
                                        FontWeight.bold, 
                                  ),
                                ),
                                subtitle: Column(
                                  children: [
                                    Text(
                                      'Size: ${data['size']}, Color: ${data['color']}, Quantity: ${data['quantity']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontStyle:
                                            FontStyle.italic, 
                                      ),
                                    ),
                                    Text(
                                      'Price: Rs ${data['price']}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
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
                )),
              

              //    Text("Cart Tab Content"),
              // ),

              // Content for the Settings tab
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Settings",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Person Settings",
                          style: TextStyle(fontSize: 18)),
                    ),
                    ListTile(
                      leading: Icon(Icons.info),
                      title: Text("About", style: TextStyle(fontSize: 16)),
                      subtitle: Text("I love coding and technology!"),
                    ),
                    ListTile(
                      leading: Icon(Icons.language),
                      title: Text("Language", style: TextStyle(fontSize: 16)),
                      subtitle: Text("English"),
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on),
                      title: Text("Delivery Address",
                          style: TextStyle(fontSize: 16)),
                      subtitle: Text("Eastfort(po) Thrissur"),
                    ),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text("Help and Support",
                          style: TextStyle(fontSize: 16)),
                      subtitle: Text("Get help and support"),
                    ),
                  ],
                  //Text("Settings Tab Content"),
                ),
              )
            ])));
  }
}
       


