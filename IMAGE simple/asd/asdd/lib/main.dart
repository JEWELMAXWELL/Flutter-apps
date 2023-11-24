import "package:flutter/material.dart";

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
              height: 300,
              width: 300,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage("asset/watch 2.jpg"))),
    )));
  }
}
