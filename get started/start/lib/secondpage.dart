import 'package:flutter/material.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  List<Map> cards = [
    {"image": "assets/apples.jpg", "name": "apple"},
    {"image": "assets/grapes.jpg", "name": "grapes"},
    {"image": "assets/pineapple.jpg", "name": "pineapple"},
    {"image": "assets/pumkin.jpg", "name": "pumpkin"},
    {"image": "assets/watermelon.jpg", "name": "watermelon"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        TextField(decoration: InputDecoration(prefixIcon: Icon(Icons.search))),
        SizedBox(
          height: 10,
        ),
      ])),
      Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: cards.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(cards[index]["image"]),
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  // Sizedbox(height: 5),
                  child: Text(cards[index]["name"]));
            }),
      ),
    ]);
  }
}
