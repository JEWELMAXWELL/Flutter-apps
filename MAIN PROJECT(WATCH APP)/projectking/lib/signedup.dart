import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectking/myaccount.dart';
import 'package:projectking/reusable_widget.dart';
import 'package:projectking/signin.dart';

class Signedup extends StatefulWidget {
  const Signedup({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<Signedup> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
  
  var watches;
   void showSnackbar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Sign Up",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
            image: AssetImage("asset/watch 2.jpg"),
            fit: BoxFit.cover,
          ),
        ),
       
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter UserName", Icons.person_outline, false,
                    _userNameTextController, errorText: ''),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Email Id", Icons.person_outline, false,
                    _emailTextController, errorText: ''),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outlined, true,
                    _passwordTextController, errorText: '', 
                    ),
                const SizedBox(
                  height: 20,
                ),
                firebaseUIButton(context, "Sign Up", () {
                  FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) {
                         print("Created New Account");
                    // Show a Snackbar notification after successful signup
                    showSnackbar("Sign Up Successful");
                    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyAccountPage(
          fullName: _userNameTextController.text,
          email: _emailTextController.text, favoriteWatches: [],)
        ),
      
    );
  
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInScreen()));
                  }).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                    // Show a Snackbar notification for signup failure
                    showSnackbar("Sign Up Failed");
                  });
                }),
                 const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to the sign-in page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignInScreen()),
                    );
                  },
                  child: Text(
                    "Have you already signed up? Click here to sign in.",
                    style: TextStyle(
                      color: Colors.blue, // You can change the color
                      decoration: TextDecoration.underline,
                    
                  ),
                ),
              
            
        
            )],
            ),
          ))),
    );
  }
}

