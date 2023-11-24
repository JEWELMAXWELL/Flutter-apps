import 'package:flutter/material.dart';

class secondpage extends StatefulWidget {
  const secondpage({super.key});

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(children: [
      SizedBox(height: 50),
      TextField(
        decoration: InputDecoration(
          hintText: "username",
          prefixIcon: Icon(Icons.accessible_outlined),
          icon: Icon(Icons.account_tree_sharp),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        ),
      ),
      SizedBox(height: 50),
      TextField(
          decoration: InputDecoration(
              hintText: "email",
              prefixIcon: Icon(
                Icons.add_chart_sharp,
                color: Colors.blue,
              ),
              icon: Icon(Icons.access_alarm_rounded),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)))),
      SizedBox(
        height: 50,
      ),
      TextField(
        decoration: InputDecoration(
            hintText: "password",
            prefixIcon: Icon(Icons.add_business_rounded),
            icon: Icon(Icons.account_circle_rounded),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
        obscureText: true,
      ),
      SizedBox(
        height: 50,
      ),
      TextField(
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
            hintText: "Mobile number",
            prefixIcon: Icon(Icons.abc),
            icon: Icon(Icons.navigate_next),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
      ),
      SizedBox(height: 50),
      ElevatedButton(onPressed: () {}, child: Text("Register"))
    ])));
  }
}
