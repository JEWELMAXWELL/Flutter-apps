import 'package:designs/thirdpage.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(5),
                child: SafeArea(
                    child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu),
                      CircleAvatar(
                        child: Image(image: AssetImage('assets/dboy.png')),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Delicous food ready to deliver for you",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        focusColor: Colors.red,
                        hintText: "search"),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 110,
                        child:
                            TextButton(onPressed: () {}, child: Text("Burger")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.red),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 50,
                        width: 110,
                        child:
                            TextButton(onPressed: () {}, child: Text("pizza")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                      ),
                      SizedBox(width: 30),
                      Container(
                        height: 50,
                        width: 110,
                        child:
                            TextButton(onPressed: () {}, child: Text("soup")),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Text("Most Popular"),
                  SizedBox(height: 30),
                  Container(
                      height: 700,
                      child: GridView.count(
                          crossAxisCount: 2,
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                            Card(
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    GestureDetector(onTap: (() {Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdPage()));
                                    }),
                                      child: Image(
                                          image: AssetImage("assets/BURGERS.png")),
                                    ),
                                    SizedBox(height: 3),
                                    Text("BURGER"),
                                    SizedBox(height: 3),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Rs 120"), Text("+")],
                                    )
                                  ],
                                ),
                              ),
                            ),Card(
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage("assets/burger 4.png")),
                                    SizedBox(height: 3),
                                    Text("BURGER"),
                                    SizedBox(height: 3),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Rs 150"), Text("+")],
                                    )
                                  ],
                                ),
                              ),
                            ),Card(
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage("assets/burger 4.png")),
                                    SizedBox(height: 3),
                                    Text("BURGER"),
                                    SizedBox(height: 3),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Rs 180"), Text("+")],
                                    )
                                  ],
                                ),
                              ),
                            ),Card(
                              child: Padding(
                                padding: EdgeInsets.all(3),
                                child: Column(
                                  children: [
                                    Image(
                                        image: AssetImage("assets/burger 4.png")),
                                    SizedBox(height: 3),
                                    Text("ham BURGER"),
                                    SizedBox(height: 3),
                                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Rs 90"), Text("+")],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ]))
                ])))), bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                currentIndex: 1,
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: ("home")),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.food_bank), label: ("home"))
                                  
],));
  }
}
