import 'package:flutter/material.dart';
import 'package:project33/firstpage.dart';
void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: firstPage(),);
  }
}