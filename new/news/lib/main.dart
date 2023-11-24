import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DemoPage());
  }
}

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  List<Map>mycard = [
    {"image":"assets/orange.jpg","name":"orange"},
    {"image":"assets/orange.jpg","name":"orange"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridview builder"),
      ),
      body: Center(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
                  itemCount: mycard.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(mycard[index]["image"]),),
                              //fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5)),
                          
                          
                    ),
                    SizedBox(height: 5),
                    Text(mycard[index]["name"])
                  ],
                );
              })),
    );
  }
}
