import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  final _formkey = GlobalKey<FormState>();
  // final TextEditingController emailcontroller = TextEditingController();
  // final TextEditingController phoneNumberController = TextEditingController();
   List<String> listitems = ["O+", "AB+", "AB-", "A+", "A-", "B-"];
  String selectval = "O+";
  final CollectionReference firecollect =
      FirebaseFirestore.instance.collection('jewel007');
     TextEditingController Donorname = TextEditingController();
     TextEditingController Donorphone = TextEditingController();

      void addDonor(){
      final data = {
       'Donorname':Donorname.text,
       'Phonenumber':Donorphone.text,
       'Bloodgroup':selectval,


      };
      firecollect.add(data);




      }
  //  String dropdownValue = 'O+';


  @override
  Widget build(BuildContext context) {
    final username = TextFormField(
      autofocus: false,
      controller: Donorname,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.verified_user),
        hintText: "Donor name",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    final phonenumber = TextFormField(
      autofocus: false,
      controller: Donorphone,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'phonenumber cannot be empty';
        } else if (value.length < 8) {
          return 'phonenumber must be atleast 8 charactors';
        }
        return 'null';
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.verified_user),
        hintText: "Phone number",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    
   

    // DropdownButton(items: items, onChanged: onChanged)
//     DropdownButton<String>(
//   focusColor:Colors.white,
  
//   //elevation: 5,
//   style: TextStyle(color: Colors.white),
//   iconEnabledColor:Colors.black,
//   items: <String>[
//     'O-',
//     'O+',
//     'A+',
//     'A-',
//     'B+',
//     'B-',
//     'AB+',
//   ].map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
      
//       child: Text(value,style:TextStyle(color:Colors.black),),
//     );
//   }).toList(),
//   hint:Text(
//     "Select a bloodgroup",
//     style: TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w500),
//   ),
//   onChanged: ( value) {
//     setState(() {
//       value = value;
//     });
//   },
// );



    return Scaffold( appBar: AppBar(
      actions: [Icon(Icons.arrow_back_sharp)],
      title: Text("Add Donors"),
       backgroundColor: Colors.red,),

              body: SingleChildScrollView(
                  child: Container(
                      
                      child: Padding(
                          padding: EdgeInsets.all(36.0),
                          child: Form(
                              key: _formkey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 20),
                                  username,
                                  SizedBox(height: 20),
                                  phonenumber,
                                  
                  DropdownButton(
                    value: selectval,
                    onChanged: (value){
                       setState(() {
                          selectval = value.toString();
                       });
                    },
                    items: listitems.map((itemone){
                        return DropdownMenuItem(
                          value: itemone,
                          child: Text(itemone)
                        );
                    }).toList(),
                ),
          
                    
// Step 2.
// DropdownButton<String>(
//   // Step 3.
//   value:  'O+',
//   // Step 4.
//   items: <String>['O+', 'A+', 'B+', 'AB+','AB-','O-','A-','B-']
//       .map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(
//         value,
//         style: TextStyle(fontSize: 30),
//       ),
//     );
//   }).toList(),
//   // Step 5.
//   onChanged: (String? newValue) {
//     setState(() {
//       dropdownValue = newValue!;
//     });
//     newValue!=dropdownValue;
//   },
// ),
                                
//         DropdownButton<String>(
//   focusColor:Colors.white,
//   value: 'Android',
//   //elevation: 5,
//   style: TextStyle(color: Colors.white),
//   iconEnabledColor:Colors.black,
//   items: <String>[
//     'Android',
//     'IOS',
//     'Flutter',
//     'Node',
//     'Java',
//     'Python',
//     'PHP',
//   ].map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value,style:TextStyle(color:Colors.black),),
//     );
//   }).toList(),
//   hint:Text(
//     "Please choose a langauage",
//     style: TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w500),
//   ),
//   onChanged: (String? value) {
//     setState(() {
//       value = value;
//     });
//   },
// ),                        
                                 
                                
                                  
//                       DropdownButton<String>(
//   focusColor:Colors.white,
//   value: 'Android',
//   //elevation: 5,
//   style: TextStyle(color: Colors.white),
//   iconEnabledColor:Colors.black,
//   items: <String>[
//     'Android',
//     'IOS',
//     'Flutter',
//     'Node',
//     'Java',
//     'Python',
//     'PHP',
//   ].map<DropdownMenuItem<String>>((String value) {
//     return DropdownMenuItem<String>(
//       value: value,
//       child: Text(value,style:TextStyle(color:Colors.black),),
//     );
//   }).toList(),
//   hint:Text(
//     "Please choose a langauage",
//     style: TextStyle(
//         color: Colors.black,
//         fontSize: 14,
//         fontWeight: FontWeight.w500),
//   ),
//   onChanged: (String value) {
//     setState(() {
//       _chosenValue = value;
//     });
//   },
// ),
SizedBox(height: 20),
   ElevatedButton(onPressed: (){
    addDonor();
    Navigator.pop(context);
   },style: ButtonStyle(minimumSize: MaterialStateProperty.all(Size(double.infinity,50)),
   backgroundColor: MaterialStateProperty.all(Colors.red))
   , child: Text("Submit",style: TextStyle(fontSize: 20),)) ]))
                                





      )
       )
                      




    //     appBar: AppBar(
    //   actions: [Icon(Icons.arrow_back_sharp)],
    //   title: Text("Add Donors"),
    //   backgroundColor: Colors.red,
    // ),body: TextField(),
    
    ));
  }
}
