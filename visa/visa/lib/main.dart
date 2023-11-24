import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        height: 200,
        width: 200,
        child: Stack(children: [
          Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("asset/CAR.jpg"), fit: BoxFit.cover))),
          TextField(
              decoration: InputDecoration(
            hintText: "username",
            border: OutlineInputBorder(),
          ))
        ]),
      )),
    ));
  }
}
