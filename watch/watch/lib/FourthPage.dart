import 'package:flutter/material.dart';

class FourthPage extends StatefulWidget {
  const FourthPage({super.key});

  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
//   List<String> imagepaths = [
//   'assets/watch 1.jpg',
//   'assets/watch 2.jpg',
//   'assets/watch 3.jpg',
// ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.yellow,
        body: Column( children: [
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
                ));
                     
         
         
  }
  }
         
            // ListView(
            //      scrollDirection: Axis.horizontal,
            //     children: [
            //       Card(
            //         child: Image(
            //           image: AssetImage(
            //             "assets/watch 1.jpg",
            //           ),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //       Card(
            //         child: Image(
            //           image: AssetImage(
            //             "assets/watch 1.jpg",
            //           ),
                
            //      fit: BoxFit.cover,
            //         ),
            //       ),
            //       Card(
            //         child: Image(
            //           image: AssetImage(
            //             "assets/watch 1.jpg",
            //           ),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
   
              // )]
              //  )]));}
          
          
          // Container(
          //     height: 100,
          //     width: 100,
          //     child: ListView.builder(
          //     // the number of items in the list
          //     itemCount: 5,
          //     // myProducts.length,

          //     // display each item of the product list
          //     itemBuilder: (context, index) {
          //       return Card(
          //     // In many cases, the key isn't mandatory
          //     key: ValueKey(5
          //       //myProducts[index]
          //       ),
          //     margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          //     child: Padding(
          //         padding: const EdgeInsets.all(10),
          //         child: Text("watch"
          //           //myProducts[index]
          //     )),
          //       );
          //     }))
//           ListView.builder(
//   scrollDirection: Axis.horizontal,
//   itemCount: imageUrls.length,
//   itemBuilder: (context, index) {
//     return Container(
//       width: 150, // Set the width as needed
//       margin: EdgeInsets.all(8), // Add some margin between images
//       child: Image.network(imageUrls[index]),
//     );
//   },
// )
      
  

