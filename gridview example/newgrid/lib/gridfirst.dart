import 'package:flutter/material.dart';
import 'package:newgrid/watchpage.dart';
class Grid extends StatefulWidget {
  const Grid({super.key});

  @override
  State<Grid> createState() => _GridState();
}

class _GridState extends State<Grid> {List<Map<dynamic, dynamic>> mywatch=[
   {"image": "assets/watch 1.jpg", "name": "watch 1", "Price": 600},
   {"image": "assets/watch 2.jpg", "name": "watch 2", "Price": 1000},
   {"image": "assets/watch 3.jpg", "name": "watch 3", "Price": 2000},
   {"image": "assets/watch 4.jpg", "name": "watch 4", "Price": 2500},
   {"image": "assets/watch 5.jpg", "name": "watch 5", "Price": 3000},
   {"image": "assets/watch 6.jpg", "name": "watch 6", "Price": 3200},
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                    itemCount: mywatch.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell
                (onTap: () {Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => WatchPage()),);},
                        child: SizedBox(height: 10,width: 10,
                          child: Container(
                            height: 100,
                            width: 100,
                           
                                   child: Image(image: AssetImage(mywatch[index]["image"]))
                                  // Image(AssetImage(mywatch[index]["image"]
                                    //fit: BoxFit.cover),
                          // borderRadius: BorderRadius.circular(5)));
                               
                                          
                          
                            ),
                        ))]);}),),
                      // SizedBox(height: 5),
                      // Text(mywatch[index]["name"])
                    
                  ));
            }
          
                }
              
    
  







  