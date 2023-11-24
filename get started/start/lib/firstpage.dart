import 'package:flutter/material.dart';
import 'package:start/secondpage.dart';

class getstarted extends StatefulWidget {
  const getstarted({super.key});

  @override
  State<getstarted> createState() => _getstartedState();
}

class _getstartedState extends State<getstarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
      child: Column(
        children: [
          Container(child: 
          Card(child: Image(image: AssetImage("assets/fruits.jpg"),),),),Container(child: ElevatedButton(onPressed: () {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => secondPage()));
            },
          
          child: Text("Get started"))
      )],
      ),
    ));
  }
}