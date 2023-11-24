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
            body: Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(50),
      height: 300,
      width: 300,
      decoration: BoxDecoration(
          color: Colors.pinkAccent,
          border: Border.all(color: Colors.brown, width: 5),
          borderRadius: BorderRadius.circular(15)),
    )));
  }
}
