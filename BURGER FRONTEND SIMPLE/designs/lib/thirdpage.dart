import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(5),
          child: SafeArea(
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(Icons.backspace_sharp),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ]),
              SizedBox(height: 30),
              Image(image: AssetImage("assets/burger 4.png")),
              SizedBox(height: 30),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "Chicken Burger",
                  style: TextStyle(fontSize: 30),
                ),
                Text("Rs. 120",
                    style: TextStyle(fontSize: 30, color: Colors.red))
              ]),
              SizedBox(height: 20),
              Row(children: [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                ),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 10),
                Icon(Icons.star, color: Colors.yellow),
                SizedBox(width: 10)
              ]),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Ingredients",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/cheese.png")),
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/meat.png")),
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/onion.png")),
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(6)),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/tomato.png")),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(6)),
                  )
                ],
              ),
              SizedBox(height: 45),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(padding: EdgeInsets.all(10),
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Colors.white),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Center(
                                child: Text(
                              "-",
                              style: TextStyle(fontSize: 30),
                            )),
                          ),
                          SizedBox(width: 2),
                          Text("1", style: TextStyle(fontSize: 30)),
                          SizedBox(width: 2),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                            ),
                            child: Center(
                                child:
                                    Text("+", style: TextStyle(fontSize: 30))),
                          ),
                        ])),
                SizedBox(width: 20),
                Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(7)),
                    child: Center(
                        child: Text(
                      "Add To Cart",
                      style: TextStyle(fontSize: 20),
                    )))
              ]),
            ]),
          )),
    ));
  }
}
