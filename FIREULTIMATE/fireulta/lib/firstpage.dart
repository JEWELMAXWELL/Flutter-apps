import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireulta/secondpage.dart';
import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  final CollectionReference firecollect =
      FirebaseFirestore.instance.collection('jewel007');
      void deleteDonor(docid){
        firecollect.doc(docid).delete();


      }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Blood Donation App")),
          backgroundColor: Colors.red,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => secondpage()));
          },
          child: Icon(Icons.add),
        ),
        body: StreamBuilder(
            stream: firecollect.orderBy('Donorname').snapshots(),
            builder: ((context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemBuilder: ((context, index) {
                    final DocumentSnapshot firedisplay =
                        snapshot.data.docs[index];
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 80,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 30,
                                  child: Text(
                                    firedisplay['Bloodgroup'],
                                    style: TextStyle(fontSize: 25),
                                  ),
                                )),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      firedisplay['Donorname'],
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      firedisplay['Phonenumber'].toString(),
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, '/update',
                                            arguments: {
                                              'Donorname': firedisplay['Donorname'],
                                              'Phonenumber': firedisplay['Phonenumber'].toString(),
                                              'Bloodgroup': firedisplay['Bloodgroup'],
                                              'id': firedisplay.id,

                                            });
                                      },
                                      icon: Icon(Icons.edit),
                                      iconSize: 30,
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        deleteDonor(firedisplay.id);
                                      },
                                      icon: Icon(Icons.delete),
                                      iconSize: 30,
                                    ),
                                  ],
                                )
                              ],
                            )));
                  }),
                  itemCount: snapshot.data!.docs.length,
                );
              }
              return Container();
            })));
  }
}
