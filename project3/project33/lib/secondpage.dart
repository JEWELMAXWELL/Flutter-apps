import 'package:flutter/material.dart';

class signPage extends StatefulWidget {
  const signPage({super.key});

  @override
  State<signPage> createState() => _signPageState();
}

class _signPageState extends State<signPage> {
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcContorller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final emailfield = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'email cannot be empty';
        } else if (value.length < 8) {
          return 'email must be atleast 8 charactors';
        }
        return 'null';
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.email),
        hintText: "email",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    final username = TextFormField(
      autofocus: false,
      controller: emailcontroller,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return 'email cannot be empty';
        } else if (value.length < 8) {
          return 'email must be atleast 8 charactors';
        }
        return 'null';
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.verified_user),
        hintText: "Username",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
    final passwordfield = TextFormField(
        autofocus: false,
        controller: passwordcContorller,
        keyboardType: TextInputType.visiblePassword,
        validator: (value) {
          if (value!.isEmpty) {
            return 'password cannot be empty';
          } else if (value.length < 8) {
            return 'password must be atleast 8 charachtors';
          }
          return 'null';
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.password),
          hintText: "password",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ));final loginbuttons = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        child: MaterialButton(onPressed: () {
          if (_formkey.currentState!.validate()) {
            debugPrint("all valdidation passed");
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => signPage()));
          }
        } ,child: Text("Register"),));
    

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.all(36.0),
                        child: Form(
                            key: _formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 20),
                                emailfield,
                                SizedBox(height: 20),
                                username,
                                SizedBox(height: 20),
                                passwordfield,
                                SizedBox(height: 20),
                                loginbuttons,],
      )
       )
                )
                        )
                        )
                       )
      );
  }
}
