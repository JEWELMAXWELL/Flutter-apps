import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WatchBrand {
  final String logo;
  final String name;
  final String description;

  WatchBrand({
    required this.logo,
    required this.name,
    required this.description,
  });
}

class BrandsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Watch Brands')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('watches').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('No watch brands available.'),
            );
          } else {
            final List<QueryDocumentSnapshot> documents = snapshot.data!.docs;
            List<WatchBrand> watchBrands = [];

            documents.forEach((doc) {
              final data = doc.data() as Map<String, dynamic>;
              watchBrands.add(
               WatchBrand(
  logo: data['image_url'] ?? '', // Use 'image_url' field
  name: data['name'] ?? '',
  description: data['description'] ?? '',
),
              );
            });

            return ListView.builder(
              itemCount: watchBrands.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 3,
                    child: ListTile(
                      leading: Image.network(watchBrands[index].logo, width: 60), // Load image from network
                      title: Text(watchBrands[index].name),
                      subtitle: Text(watchBrands[index].description),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BrandDetailsPage(brand: watchBrands[index]),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// class WatchBrand {//declares the keys of the image,name and description to call it when neccesary to display them.
//   final String logo;
//   final String name;
//   final String description;

//   WatchBrand({
//     required this.logo,
//     required this.name,
//     required this.description,
//   });
// }

// class BrandsPage extends StatelessWidget {
//   final List<WatchBrand> watchBrands = [
//     WatchBrand(
//       logo: "asset/watch 1.jpg",
//       name: "Rolex",
//       description: "Swiss luxury watch manufacturer based in Geneva.",
//     ),
//     WatchBrand(
//       logo: "asset/watch 2.jpg",
//       name: "TAG Heuer",
//       description: "Swiss watchmaker known for its sports watches and chronographs.",
//     ),
//     WatchBrand(
//       logo: "asset/watch 3.jpg",
//       name: "Seiko",
//       description: "Japanese company that produces affordable and reliable watches.",
//     ),
//     // Add more watch brands here
//   ];


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Watch Brands')),
//       body: ListView.builder(
//         itemCount: watchBrands.length,
//         itemBuilder: (BuildContext context, int index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 3,
//               child: ListTile(
//                 leading: Image.asset(watchBrands[index].logo, width: 60),
//                 title: Text(watchBrands[index].name),
//                 subtitle: Text(watchBrands[index].description),
//                 trailing: Icon(Icons.arrow_forward),
//                 onTap: () {
//                   // Navigate to the brand's details page
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           BrandDetailsPage(brand: watchBrands[index]),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
class BrandDetailsPage extends StatelessWidget {
  final WatchBrand brand;

  BrandDetailsPage({required this.brand});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(brand.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200, // Set the height of the background image container
              decoration: BoxDecoration(
                image: DecorationImage(
                   image: NetworkImage(brand.logo),
                  // image: AssetImage('asset/watch 1.jpg'), // Replace with your background image asset
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Text(
                    brand.name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    brand.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Add star rating widget here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_border, color: Colors.yellow),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Add features or additional details here
                  Text(
                    'Features:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Feature 1: Lorem ipsum dolor sit amet.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Feature 2: Consectetur adipiscing elit.',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Feature 3: Nullam eget felis nec justo ullamcorper.',
                    style: TextStyle(fontSize: 16),
                  ),
                  // Add more features as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
