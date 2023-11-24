// import 'package:flutter/material.dart';
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
// List<Map> mywatch = [
//   {"image": "assets/watch 1.jpg", "name": "watch 1", "Price": 600},
//   {"image": "assets/watch 2.jpg", "name": "watch 2", "Price": 1000},
//   {"image": "assets/watch 3.jpg", "name": "watch 3", "Price": 2000},
//   {"image": "assets/watch 4.jpg", "name": "watch 4", "Price": 2500},
//   {"image": "assets/watch 5.jpg", "name": "watch 5", "Price": 3000},
//   {"image": "assets/watch 6.jpg", "name": "watch 6", "Price": 3200},
// ];
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(home:  Scaffold(
//       backgroundColor: Colors.grey,body:
//       //SingleChildScrollView(

//         ListView.builder(
//               itemCount: mywatch.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Column(
//                   children: [
//                     Container(
//                       height: 500,
//                       width: 500,
//                       decoration: BoxDecoration(
//                           image: DecorationImage(
//                               image: AssetImage(mywatch[index]["image"]),),
//                               //fit: BoxFit.cover),
//                           borderRadius: BorderRadius.circular(5)),

//                     ),

//                         Text(mywatch[index]["name"]),SizedBox(width: 30),Text(mywatch[index]["price"])
//                       ],
//                   );

//   })));
//   }
// }

// //       scrollDirection: Axis.vertical,child: Column(children:[Container(
// //         child: ListView.builder(itemCount: mywatch.length,
// //                             scrollDirection: Axis.vertical,
// //                             itemBuilder: (context, index) {Row(children: [
// //                     //            decoration: BoxDecoration(

// //                     //       image: DecorationImage(
// //                     //           Text(mywatch[index]["name"])),
// //                     //           image: AssetImage(mywatch[index]["image"]),),},
// //                     //           //fit: BoxFit.cover),
// //                     //       borderRadius: BorderRadius.circular(5)),
// //                     //   ),
// //                     // SizedBox(height: 5),
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map<dynamic, dynamic>> mywatch = [
    {"image": "assets/watch 1.jpg", "name": "watch 1", "Price": 600},
    {"image": "assets/watch 2.jpg", "name": "watch 2", "Price": 1000},
    {"image": "assets/watch 3.jpg", "name": "watch 3", "Price": 2000},
    {"image": "assets/watch 4.jpg", "name": "watch 4", "Price": 2500},
    {"image": "assets/watch 5.jpg", "name": "watch 5", "Price": 3000},
    {"image": "assets/watch 6.jpg", "name": "watch 6", "Price": 3200},
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Listview"),
            ),
            body: ListView.builder(
                itemCount: mywatch.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                   Image(
                      image: AssetImage(mywatch[index]["image"]),
                    ),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(mywatch[index]["name"],
                            style: TextStyle(fontSize: 20),
                      ),
                          
                         Text(mywatch[index]["Price"].toString(),style: TextStyle(fontSize: 20)),
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    // Image(
                    //   image: AssetImage(mywatch[index]["image"]),
                    // ),
                  ]);
                })));
  }
}
