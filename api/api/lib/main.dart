import 'package:api/getfile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Getfile());
  }
}

 var stringresponse;
  var mapresponse;
 
class Getfile extends StatefulWidget {
  const Getfile({super.key});

  @override
  State<Getfile> createState() => _GetfileState();
}

class _GetfileState extends State<Getfile> {

    Future apicall()async{
    http.Response response;
    response=await http.get(Uri.parse("https://dog.ceo/api/breeds/image/random")) ;
    if(response.statusCode==200){
      print("get=="+response.statusCode.toString());
      setState(() {
        stringresponse=response.body;
        mapresponse=json.decode(response.body);
        
      });
    } 
    

  }
  @override
  void initState(){
    apicall();
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Container(
        height: 200,width: 300,
        // child:Text(mapresponse["status"])
        child:Center(child: Image.network(mapresponse["message"],fit: BoxFit.cover,))
          // Image.network("https://cdn.britannica.com/79/232779-050-6B0411D7/German-Shepherd-dog-Alsatian.jpg")),
    ),));
  }
}
 
// import 'package:flutter/material.dart';
// import 'package:http/http.dart'as http;
// import 'dart:convert';
// void main(){
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Homepage(),
//     );
    
//   }
// }
// var stringResponse;
// var mapResponse;

// class Homepage extends StatefulWidget {
//   const Homepage({Key? key}) : super(key: key);

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

// class _HomepageState extends State<Homepage> {
// Future apicall() async{
//   http.Response response;
//   response=await
//   http.get(Uri.parse("https://dog.ceo/api/breeds/image/random"));
//   if (response.statusCode == 200){
//     setState(() {
//        stringResponse = response.body;
//        mapResponse = json.decode(response.body);
      
    
//     });
//   }
// }
// @override
//   void initState() {
//    apicall();
//     super.initState();
//   }


// @override
//   Widget build(BuildContext context) {
//  return MaterialApp(
//       home: Scaffold(appBar: AppBar(
//         title: Text("api demo"),
//       ),
//       body: Center(
//         child: Container(
//           height: 200,
//       width: 300,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
      
//         color: Colors.blue),
//         child: Center(
//           //  child:Text(mapResponse['status'].toString())
//            child: Image.network(mapResponse["message"]),
//           )),
//       ),
//       )
//       );
//        }
//   }