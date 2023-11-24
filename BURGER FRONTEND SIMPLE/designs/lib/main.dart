import 'package:designs/zerothpage.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,     theme: ThemeData(
      scaffoldBackgroundColor: Colors.white60),home: zerothPage(),);  }
}