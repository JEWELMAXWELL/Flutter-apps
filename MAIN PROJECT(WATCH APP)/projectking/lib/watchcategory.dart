import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projectking/WatchDetailsScreen.dart';
class WatchCategoryPage extends StatefulWidget {
  @override
  _WatchCategoryPageState createState() => _WatchCategoryPageState();
}
class _WatchCategoryPageState extends State<WatchCategoryPage> {
  List<Map<String, dynamic>> watches = [];
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
    fetchWatchesFromFirestore().then((watchList) {
      setState(() {
        watches = watchList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Watch Categories")),
      body: Column(
        children: [
          Image.asset('asset/watch 1.jpg'),
          SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: watches.length,
              itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                  onTap: () {
                    // Navigate to watch details page for the selected watch
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WatchDetailsScreen(
                          watch: watches[index],colorOptions: ColorOptions[index],
                        ),
                      ),
                    );
                  },
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
                        Image.network(watches[index]['image_url'], height: 100), // Use 'image_url' from Firestore
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
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';

// class WatchCategoryPage extends StatelessWidget {
//   final List<Map<String, dynamic>> watches = [
//     {"name": "Watch 1", "price": 100, "image": "asset/watch 7.jpg"},
//     {"name": "Watch 2", "price": 150, "image": "asset/watch 8.jpg"},
//     {"name": "Watch 3", "price": 200, "image": "asset/watch 9.jpg"},
//     {"name": "Watch 4", "price": 120, "image": "asset/watch 10.jpg"},
//     {"name": "Watch 5", "price": 180, "image": "asset/watch 11.jpg"},
//     {"name": "Watch 6", "price": 250, "image": "asset/watch 12.jpg"},
//   ];


// Future<List<String>> fetchImagesFromFirebase() async {
//   List<String> imageUrls = [];

//   try {
//     final storage = FirebaseStorage.instance;
//     final ListResult result = await storage.ref('watch_images').list();
//     final List<Reference> allFiles = result.items;

//     for (final Reference ref in allFiles) {
//       final url = await ref.getDownloadURL();
//       imageUrls.add(url);
//     }
//   } catch (e) {
//     print("Error fetching images: $e");
//   }

//   return imageUrls;
// }
//   List<String> imageUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchImagesFromFirebase().then((urls) {
//       setState(() {
//         imageUrls = urls;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Watch Categories")),
//       body: Column(
//         children: [
//           Image.asset('asset/watch 1.jpg'), 
//           SizedBox(height: 20),
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemCount: watches.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to watch details page for the selected watch
//                   },
//                   child: Container(
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(watches[index]['image'], height: 100), // Watch image
//                         SizedBox(height: 5),
//                         Text(watches[index]['name']),
//                         SizedBox(height: 5),
//                         Text('Rs ${watches[index]['price']}'),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
