// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// class Getfile extends StatefulWidget {
//   const Getfile({super.key});

//   @override
//   State<Getfile> createState() => _GetfileState();
// }

// class _GetfileState extends State<Getfile> {

//   var stringresponse;
//   var mapresponse;
//     Future apicall()async{
//     http.Response response;
//     response=await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random")) ;
//     if(response.statusCode==200){
//       setState(() {
//         stringresponse=response.body;
//         mapresponse=json.decode(response.body);
        
//       });
//     } 
    

//   }
//   @override
//   void initState(){
//     apicall();
//     super.initState();


//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Center(
//       child: Container(
//         height: 300,width: 300,
//         child:Image.network(mapresponse["message"])
//           // Image.network("https://cdn.britannica.com/79/232779-050-6B0411D7/German-Shepherd-dog-Alsatian.jpg")),
//     ),));
//   }
// }