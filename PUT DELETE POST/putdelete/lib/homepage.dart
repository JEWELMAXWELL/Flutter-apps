// import 'package:flutter/material.dart';
// import 'package:putdelete/Custombotton.dart';
// class Put extends StatelessWidget {
//   const Put({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(body: Column(children:
//     Custombotton(symbol: ,

//   }
// // }
// import 'package:flutter/material.dart';

// import 'Widgets/custombotton.dart';
// import 'Widgets/custombutton2.dart';
// import 'Widgets/custombutton3.dart';
// import 'Widgets/custombutton4.dart';

// import 'package:refactoring/Widgets/Custombotton.dart';
// import 'package:refactoring/Widgets/custombotton.dart';

// class Put extends StatefulWidget {
//   const Put({super.key});

//   @override
//   State<Put> createState() => _PutState();
// }

// class _PutState extends State<Put> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//         // Container(
//           // child:
//            Custombotton(symbol: '', onTap: () {}),
//         // ),
//         SizedBox(
//           height: 20,
//         ),
//         custombotton2(symbol: '', onTap: () {}), SizedBox(
//           height: 20,
//         ),
//         custombotton3(symbol: '', onTap: () {}), SizedBox(
//           height: 20,
//         ),
//         custombotton4(symbol: '', onTap: () {}),
//       ]),
//     );
//   }
// }
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:putdelete/Widgets/Custombotton.dart';
import 'package:putdelete/models/models.dart';
import 'package:putdelete/service.dart';
import 'Widgets/Custombotton.dart';

class Put extends StatefulWidget {
  const Put({super.key});

  @override
  State<Put> createState() => _PutState();
}

class _PutState extends State<Put> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: Column(children: [
        SizedBox(height: 30),

        Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custombotton(
                      name: 'post',description: 'add user',
                      onTap: ()async {var postname = Models(name: 'Jewel',qualifications: [Qualification(degree: 'plustwo',completionData: '18/12/2014' 
                      )]);
                      var postpass = await Service().post('/users', postname).catchError((err){log(err);});
                      if(postpass==null)
                      return;
                      print("successfully completed"); 
                      
                        
                      }),])),
                      SizedBox(height: 20,),
                       Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custombotton(
                      name: 'put',description: 'edit user',
                      onTap: ()async {
                        var id = 2006;
                        var putname = Models(name: 'amal',qualifications: [Qualification(degree: 'deploma',completionData: '12/12/2023')]);
                      var putupdate=await Service().put('/users/$id', putname);
                      if(putupdate==null)
                    return;
                    print("successfully edited");
                     

                      })
                      ,])),
                      SizedBox(height: 20,),
                       Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Custombotton(
                      name: 'Del',description: 'Delete user',
                      onTap: ()async {
                        var id=2020;
                        var delpass=await Service().del('/users/$id');
if(delpass==null)
return;
print("Succesfully deleted");
                      }),])),
                      



                //   Custombotton(
                //       name: 'put', description: 'edit User',
                //       onTap: () {
                //         setState(() {});
                //       }), SizedBox(height: 20,),
                //   Custombotton(
                //       name: 'Del', description: 'Delete User',
                //       onTap: () {
                //         setState(() {});
                //       }),
                // ,

      //   SizedBox(
      //     height: 20,
      //   ),
      //   Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(18),
      //         color: Colors.grey,
      //       ),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Custombotton(
      //                 symbol: 'Post',
      //                 onTap: () async {
      //                   //print("jewel");                     
                        
      //                        }),
      //             Custombotton(
      //                 symbol: 'Add User',
      //                 onTap: () {
      //                   setState(() {});
      //                 }),
      //           ])),
      //   SizedBox(
      //     height: 20,
      //   ),

      //   Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(18),
      //         color: Colors.grey,
      //       ),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Custombotton(
      //                 symbol: 'Put',
      //                 onTap: () {
      //                   setState(() {});
      //                 }),
      //             Custombotton(
      //                 symbol: 'Edit User',
      //                 onTap: () {
      //                   setState(() {});
      //                 }),
      //           ])),
      //   SizedBox(
      //     height: 20,
      //   ),

      //   Container(
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(18),
      //         color: Colors.grey,
      //       ),
      //       child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //           children: [
      //             Custombotton(
      //                 symbol: 'Del',
      //                 onTap: () {
      //                   setState(() {});
      //                 }),
      //             Custombotton(
      //                 symbol: 'Delete User',
      //                 onTap: () {
      //                   setState(() {});
      //                 }),
      //           ])),

      //   //  Custombotton(symbol: '', onTap: () {
      //   //     setState(() {

      //   //     });})
       ]),
      );
  }
}
