import "package:flutter/material.dart";
import "package:image/secondpage.dart";

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _MyAppState();
}

class _MyAppState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 60,
          width: 50,
        ),
        Container(
          child: TextField(
              decoration: InputDecoration(
            hintText: "username",
            focusColor: Colors.blue,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.deepOrange)),
          )),
        ),
        SizedBox(
          height: 300,
          width: 300,
        ),
        FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text("clicked"))
      ],
    ));
  }
}
