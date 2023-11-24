import 'package:designs/SecondPage.dart';
import 'package:flutter/material.dart';


class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(children: [
          Image(
            image: AssetImage("assets/dboy.png"),
          ),
          SizedBox(height: 10),
          Text(
            "SWIGGY",
            style: TextStyle(fontSize: 80, color: Colors.orange),
          ),
          SizedBox(height: 10),
          Text("The fastest delivery"),
          SizedBox(height: 10),
          ElevatedButton(onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));}, child: Text("SignUp"))
        ])),
      ),
    );
  }
}
