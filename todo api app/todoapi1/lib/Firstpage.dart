import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';


import 'package:todoapi1/secondpage.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  List items = [];
  @override
  void initState(){
    super.initState();
    fetchTodo();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Color.fromARGB(255, 32, 175, 185),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Addpage()));
          },
          label: Text("Add Todo")),
    );
  }
  Future<void>fetchTodo()async{

    final url = 'https://631c37911b470e0e12fcdd0b.mockapi.io/api';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statuscode==200){
      final result = json['items'] as List;
    }



  }

}
