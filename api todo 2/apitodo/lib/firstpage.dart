import 'dart:convert';

import 'package:apitodo/secondpage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';



class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  bool isLoading = true;
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
      ),body: RefreshIndicator(
        onRefresh: fetchTodo,
        child: ListView.builder(itemCount: items.length,    itemBuilder: (context, index) {
          final item = items[index] as Map;
          return ListTile(
            leading: CircleAvatar(child: Text('${index+1}'),),
            title: Text(item['title'],),
          subtitle: Text(item['description']),);
      
        },),
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
    if(response.statusCode==200){
      final json = jsonDecode(response.body)as Map; 
      final result = json['items'] as List;
      setState((){
            items = result;
    });





      }
      setState(() {
        isLoading = false;

      });
    }



  }


