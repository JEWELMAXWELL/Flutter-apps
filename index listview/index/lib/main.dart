import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Map>mywatch = [
    {"image":"assets/watch 1.jpg","name":"watch 1"},
    {"image":"assets/watch 2.jpg","name":"watch 2"},
    {"image":"assets/watch 3.jpg","name":"watch 3"},
    {"image":"assets/watch 4.jpg","name":"watch 4"},
    {"image":"assets/watch 5.jpg","name":"watch 5"},
    {"image":"assets/watch 6.jpg","name":"watch 6"},

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp();
    home: Scaffold(
       body: Center(
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
                  itemCount:5,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(mywatch[index]["image"]),),
                              //fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(5)),
                         
                         
                    ),
                    SizedBox(height: 5),
                    Text(mywatch[index]["name"])
                  ],
                );
              })),
    );
  }
}