import 'package:flutter/material.dart';
import 'package:watch/FourthPage.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<Map> mywatch = [
    {"image": "assets/watch 1.jpg", "name": "watch 1", "Price": 600},
    {"image": "assets/watch 2.jpg", "name": "watch 2", "Price": 1000},
    {"image": "assets/watch 3.jpg", "name": "watch 3", "Price": 2000},
    {"image": "assets/watch 4.jpg", "name": "watch 4", "Price": 2500},
    {"image": "assets/watch 5.jpg", "name": "watch 5", "Price": 3000},
    {"image": "assets/watch 6.jpg", "name": "watch 6", "Price": 3200},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              SizedBox(height: 50),
              Container(
                height: 90,
                child: TextField(
                  decoration: InputDecoration(icon: Icon(Icons.search)),
                ),
              ),
              Container(
                height: 620,
                width: 400,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Text(
                      "    watch 1                                               price:600/-",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                          fontSize: 18),
                    ),
                    
                    Card(                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    GestureDetector(onTap: (() {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FourthPage()));
                                    }),
                              
                      child: Image(image: AssetImage("assets/watch 1.jpg")),
                    )]))), SizedBox(height: 20),
                    Text("    watch 2                                               price:800/-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontSize: 18)),
                    Card(
                      child: Image(image: AssetImage("assets/watch 2.jpg")),
                    ), SizedBox(height: 20),
                    Text("    watch 2                                               price:1200/-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontSize: 18)),
                    Card(
                      child: Image(image: AssetImage("assets/watch 3.jpg")),
                    ), SizedBox(height: 20),
                    Text("    watch 3                                             price:1500/-",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                            fontSize: 18)),
                    Card(
                      child: Image(image: AssetImage("assets/watch 4.jpg")),
                    )
                  ],
                ),
              )
            ])));
  }
}
