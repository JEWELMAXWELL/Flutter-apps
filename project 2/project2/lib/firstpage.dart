import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        primary: false,
        padding: EdgeInsets.all(20),
        children: [
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("asset/apple.jpg"))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("orange"),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("asset/orange.jpg"))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("apple"),
                  ],
                ),
              ),
            ],
          ),
          Column(children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                "asset/watermelon.jpg",
              ))),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("watermelon"),
                ],
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
