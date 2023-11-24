import 'package:flutter/material.dart';
import "package:projects/secondpage.dart";

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(
          width: 200,
          child: TextField(
              decoration: InputDecoration(
                  hintText: "username",
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))))),
      SizedBox(
        height: 100,
        width: 200,
        child: TextField(
          decoration: InputDecoration(
              hintText: "password",
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          obscureText: true,
        ),
      ),
      SizedBox(width: 200),
      ElevatedButton(onPressed: () {}, child: Text("Signup")),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Center(
            child:
                TextButton(onPressed: () {}, child: Text("Forgot password"))),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => secondpage()));
            },
            child: Text("Register"))
      ])
    ])));
  }
}
