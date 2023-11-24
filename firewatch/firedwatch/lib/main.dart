import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Watch {
  final String name;
  final String price;
  final String image;

  Watch({required this.name, required this.price, required this.image});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WatchShopPage(),
    );
  }
}

class WatchShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Shopping App'),
      ),
      body: WatchList(),
    );
  }
}

class WatchList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('watches').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<Watch> watches = snapshot.data!.docs.map((doc) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          return Watch(
            name: data['name'],
            price: data['price'],
            image: data['image'],
          );
        }).toList();

        return ListView.builder(
          itemCount: watches.length,
          itemBuilder: (context, index) {
            Watch watch = watches[index];
            return ListTile(
              title: Text(watch.name),
              subtitle: Text('Price: ${watch.price}'),
              leading: Image.network(watch.image),
            );
          },
        );
      },
    );
  }
}
