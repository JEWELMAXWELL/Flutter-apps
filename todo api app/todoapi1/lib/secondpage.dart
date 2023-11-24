import 'dart:convert';

import 'package:flutter/material.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Add Todo"),),
    body: ListView(children: [
        TextField(
          
          controller: titlecontroller,
          decoration: InputDecoration(hintText: 'Title'),),
        SizedBox(height: 20,),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(hintText: 'Description'),
        keyboardType: TextInputType.multiline,
        minLines: 5,
        maxLines: 8,
           ),
           SizedBox(height: 20,),
           ElevatedButton(onPressed: SubmitData, child: Text("Submit")),



    ],),
    
    
    );

      

  }
  Future<void> SubmitData() async {

   final title = titlecontroller.text;
   final description= descriptionController.text;
   final body = {
    "title":title,
    "description": description,
    "is_completed": false,
   };
   final url = 'https://api.nstack.in/v1/todos';
   final uri = Uri.parse(url);
   final response = await http.post(uri,body: jsonEncode(body),
   headers: {'Content-Type': 'application/json'},
   );
      if(response.statuscode==201){
        print("Creation Success");
      }else{
        print("Creation failed");
        print(response.body);
      }


  
}
} 