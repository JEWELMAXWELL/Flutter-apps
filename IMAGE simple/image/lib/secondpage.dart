import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("STACK"),
        ),
        body: Container(
          child: Center(
            child: Stack(
              children: <Widget>[
                Container(height: 300, width: 300, color: Colors.blue),
                Container(height: 200, width: 200, color: Colors.red),
                Container(height: 100, width: 100, color: Colors.yellow),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
