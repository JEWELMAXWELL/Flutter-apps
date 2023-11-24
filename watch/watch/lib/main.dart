// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // Hide the debug banner
//       debugShowCheckedModeBanner: false,

//       title: 'Kindacode.com',
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   MyHomePage({Key? key}) : super(key: key);

//   // Generate a massive list of dummy products
//   final myProducts = List<String>.generate(1000, (i) => 'Product $i');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('KindaCode.com'),
//         ),
//         // implement the list view
//         body: ListView.builder(
//             // the number of items in the list
//             itemCount: myProducts.length,

//             // display each item of the product list
//             itemBuilder: (context, index) {
//               return Card(
//                 // In many cases, the key isn't mandatory
//                 key: ValueKey(myProducts[index]),
//                 margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
//                 child: Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Text(myProducts[index])),
//               );
//             })
//             );
//   }
// }





// ..........................................
import 'package:flutter/material.dart';
import 'package:watch/firstpage.dart';
import 'package:watch/thirdPage.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridView(),);
  }
}