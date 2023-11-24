import 'package:flutter/material.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
   List<Map<dynamic, dynamic>> mywatch = [
    {"image": "assets/watch 1.jpg", "name": "watch 1", "Price": 600},
    {"image": "assets/watch 2.jpg", "name": "watch 2", "Price": 1000},
    {"image": "assets/watch 3.jpg", "name": "watch 3", "Price": 2000},
    {"image": "assets/watch 4.jpg", "name": "watch 4", "Price": 2500},
    {"image": "assets/watch 5.jpg", "name": "watch 5", "Price": 3000},
    {"image": "assets/watch 6.jpg", "name": "watch 6", "Price": 3200},
  ];
  @override
  Widget build(BuildContext context) {
     return Scaffold(backgroundColor: Colors.yellow,
        body: ListView.builder(
                itemCount: mywatch.length,
                itemBuilder: (BuildContext context, int index) { Column( children: [
          Container(margin: EdgeInsets.only(left: 10),
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/watch 1.jpg"),
              ),
            ),
            child: SizedBox(height: 20),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price: 1200"),
                Icon(Icons.thumb_up),
                Icon(Icons.star)
              ],
            ),
          ),
         SizedBox(height: 50),
          Container(
              height: 160,
              width: 300,
              child: Text(
                  "A titanium or ceramic watch is harder / better, but those watches also have a more expensive price tag. Stainless steel compared to 'normal' steel can not be affected by moisture and perspiration. Also, getting skin irritation is rare with an stainless steel watch.")),
  
          SizedBox(
            height: 1,
          ),
           Container(
             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(margin: EdgeInsets.only(left: 15),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/watch 1.jpg")),
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    SizedBox(width: 10),
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/watch 2.jpg")),
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(6)),
                    ),
                    SizedBox(width: 10),
                    Container(margin: EdgeInsets.only(right: 13),
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/watch 3.jpg")),
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(6)),
                    ), ])),SizedBox(height: 50), Container(
                      height: 50,
                      width: 150,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(7)),

                      
                        child: Center(
                            child: Text(
                          "Add To Cart",
                          style: TextStyle(fontSize: 20),
                        )),
                      )
                      
           
                    
                  ],
                );}));
                     
         
         
  }
  }
  