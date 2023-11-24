import 'package:flutter/material.dart';
class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      decoration: BoxDecoration( image: DecorationImage(
      image: AssetImage("asset/car.jpg"),fit: BoxFit.cover),),));
  }
}