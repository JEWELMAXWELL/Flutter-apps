import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projectking/WatchDetailsScreen.dart';
import 'package:projectking/myaccount.dart';
import 'watch.dart';

class Watch {
  final String id;
  final String image;
  final String name;
  final String price;
  bool isFavorite;

  Watch({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'image_url': image,
      'id': id,
      'name': name,
      'price': price,
      // Add other properties here
    };
  }

  // Add a factory constructor to create a Watch object from a map
  factory Watch.fromMap(Map<String, dynamic> map) {
    return Watch(
      image: map['image_url'],
      id: map['id'],
      name: map['name'],
      price: map['price'],
      // Initialize other properties from the map here
    );
  }
}

class WatchesPage extends StatefulWidget {
  @override
  _WatchesPageState createState() => _WatchesPageState();
}

class _WatchesPageState extends State<WatchesPage>
    with TickerProviderStateMixin {
  final FirestoreService firestoreService = FirestoreService();

  late TabController _tabController;
  List<Watch> watches = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Fetch watches from Firestore when the page loads
    fetchWatchesFromFirestore();
  }

  Future<void> fetchWatchesFromFirestore() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('watches').get();
      List<Watch> fetchedWatches = [];

      for (final doc in snapshot.docs) {
        fetchedWatches.add(
          Watch(
            id: 'your_unique_id_here',
            image: doc['image_url'],
            name: doc['name'],
            price: doc['price'],
          ),
        );
      }

      setState(() {
        watches = fetchedWatches;
      });
    } catch (e) {
      print("Error fetching watches from Firestore: $e");
    }
  }

  List<Watch> filteredWatches = [];
  Future<List<Watch>> fetchBestsellersFromFirestore() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('Bestsellers')
          .get(); // Replace 'Bestsellers' with your actual collection name
      List<Watch> fetchedBestsellers = [];

      for (final doc in snapshot.docs) {
        fetchedBestsellers.add(
          Watch(
            id: 'your_unique_id_here',
            image: doc['image_url'],
            name: doc['name'],
            price: doc['price'],
          ),
        );
      }

      return fetchedBestsellers;
    } catch (e) {
      print("Error fetching bestsellers from Firestore: $e");
      return []; // Return an empty list or handle the error as needed.
    }
  }

  // void toggleFavoriteStatus(String watchId) {
  //   setState(() {
  //     final watchIndex = watches.indexWhere((watch) => watch.id == watchId);
  //     if (watchIndex != -1) {
  //       watches[watchIndex].isFavorite = !watches[watchIndex].isFavorite;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Watch Store'),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'New Arrivals'),
              Tab(text: 'Bestsellers'),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                onChanged: (value) {
                  // Filter the watches based on the search query
                  filterWatches(value);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search...',
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // New Arrivals Tab View
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 225,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: watches.length,
                    itemBuilder: (BuildContext context, int index) {
                      //  GestureDetector(onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => WatchDetailsScreen(
                      //           watch: watches[index], // Pass the watch details
                      //         ),
                      //       ),
                      //     );
                      //   });
                      final watch = watches[index];
                      return Card(
                        elevation: 3,
                        child: LayoutBuilder(
                          builder: (BuildContext context,
                              BoxConstraints constraints) {
                            return SizedBox(
                              width: constraints
                                  .maxWidth, // Expand the width to the maximum
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.network(watch.image,
                                      height: 120, width: 120),
                                  SizedBox(height: 8),
                                  Text(watch.name),
                                  SizedBox(height: 5),
                                  Text(watch.price),
                                  IconButton(
                                    onPressed: () {
                                      // Call the addToFavorites method to add the watch to Firestore
                                      FirestoreService().addToFavorites(watch);

                                      // Toggle the favorite status locally
                                      setState(() {
                                        watch.isFavorite = !watch.isFavorite;
                                      });
                                    },
                                    icon: Icon(
                                      watch.isFavorite
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: watch.isFavorite
                                          ? Colors.red
                                          : Colors.grey,
                                    ),
                                  ),

                                  // IconButton(
                                  //   onPressed: () {

                                  //                                   Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => MyAccountPage(
                                  //       fullName: 'Your Name',
                                  //       email: 'your@email.com',
                                  //       favoriteWatches: watches.where((watch) => watch.isFavorite).toList(),
                                  //     ),
                                  //   ),
                                  // );
                                  //                                      MyAccountPage(
                                  //   fullName: "Jewel Maxwell", // Replace with the user's full name
                                  //   email: "jewelmaxwell007@gmail.com", // Replace with the user's email
                                  //   favoriteWatches: watches.where((watch) => watch.isFavorite).toList(),
                                  // );

                                  //     setState(() {
                                  //       watch.isFavorite = !watch.isFavorite;

                                  //     });
                                  //   },
                                  //   icon: Icon(
                                  //     watch.isFavorite
                                  //         ? Icons.favorite
                                  //         : Icons.favorite_border,
                                  //     color: watch.isFavorite
                                  //         ? Colors.red
                                  //         : Colors.grey,
                                  //   ),
                                  // ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),

                  // Bestsellers Tab View
                  FutureBuilder(
                      // Fetch data from the 'Bestsellers' collection
                      future: fetchBestsellersFromFirestore(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator(); // Show a loading indicator while fetching data.
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          List<Watch> bestsellers =
                              snapshot.data as List<Watch>;
                          return GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisExtent: 225,
                              mainAxisSpacing: 10,
                            ),
                            itemCount: bestsellers.length,
                            itemBuilder: (BuildContext context, int index) {
                              final watch = bestsellers[index];

                              // GridView.builder(
                              //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              //     crossAxisCount: 2,
                              //     crossAxisSpacing: 10,
                              //     mainAxisExtent: 225,
                              //     mainAxisSpacing: 10,
                              //   ),
                              //   itemCount: watches.length,
                              //   itemBuilder: (BuildContext context, int index) {
                              //     final watch = watches[index];
                              return Card(
                                elevation: 3,
                                child: LayoutBuilder(
                                  builder: (BuildContext context,
                                      BoxConstraints constraints) {
                                    return SizedBox(
                                      width: constraints
                                          .maxWidth, // Expand the width to the maximum
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.network(watch.image,
                                              height: 120, width: 120),
                                          SizedBox(height: 8),
                                          Text(watch.name),
                                          SizedBox(height: 5),
                                          Text(watch.price),
                                          IconButton(
                                            onPressed: () {
                                              // Call the addToFavorites method to add the watch to Firestore
                                              FirestoreService()
                                                  .addToFavorites(watch);

                                              // Toggle the favorite status locally
                                              setState(() {
                                                watch.isFavorite =
                                                    !watch.isFavorite;
                                              });
                                            },
                                            icon: Icon(
                                              watch.isFavorite
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: watch.isFavorite
                                                  ? Colors.red
                                                  : Colors.grey,
                                            ),
                                          ),
                                          // IconButton(
                                          //   onPressed: () {
                                          //     setState(() {
                                          //       watch.isFavorite =
                                          //           !watch.isFavorite;
                                          //     });
                                          //   },
                                          //   icon: Icon(
                                          //     watch.isFavorite
                                          //         ? Icons.favorite
                                          //         : Icons.favorite_border,
                                          //     color: watch.isFavorite
                                          //         ? Colors.red
                                          //         : Colors.grey,
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void filterWatches(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all watches from Firestore
      setState(() {
        watches = [];
        fetchWatchesFromFirestore();
      });
    } else {
      // Filter the watches based on the search query
      final filteredWatches = watches.where((watch) {
        return watch.name.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        watches = filteredWatches;
      });
    }
  }
}

class FirestoreService {
  final CollectionReference favoritesCollection =
      FirebaseFirestore.instance.collection('fav of store');

  Future<void> addToFavorites(Watch watch) async {
    try {
      await favoritesCollection.add(watch.toMap());
    } catch (e) {
      print("Error adding watch to favorites: $e");
    }
  }
}
