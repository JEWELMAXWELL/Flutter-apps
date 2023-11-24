import 'package:flutter/material.dart';
import 'package:uaer/secondpage.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        padding: EdgeInsets.all(50),
        child: TextField(
            decoration: InputDecoration(
                hintText: "username",
                focusColor: Colors.blue,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)))),
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        padding: EdgeInsets.all(50),
        child: TextField(
            decoration: InputDecoration(
                hintText: "PASSWORD",
                focusColor: Colors.blue,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepOrange)))),
      ),
      TextButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage()));
        },
        child: Text("Signin"),
      )
    ]));
  }
}
