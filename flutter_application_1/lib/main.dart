
import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondpage.dart';
class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Blood Donation App")),backgroundColor: Colors.red,),
       floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

      
                floatingActionButton:  FloatingActionButton(    backgroundColor: Colors.red,   onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => secondpage()));


  },child: Icon(Icons.add),), )
    ;
  }
}