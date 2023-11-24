import 'package:flutter/material.dart';

class Custombotton extends StatelessWidget {
  const Custombotton({required this.name,required this.description, required this.onTap});
  final String name;
  final String description;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 50,
            width: 410,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Colors.grey,
            ),
            child:
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        name,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  
               Text(
                    description,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
        ]),),
        
        
          
        ],
      ),
    );
  }
}


/* import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
    
  // In the Constructor onTap and Symbol fields are added.
  const CustomButton({ required this.onTap, required this.symbol});
    
  // It Requires 2 fields Symbol(to be displayed)
  // and onTap Function
  final String symbol;
  final VoidCallback onTap;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        
      // The onTap Field is used here.
      onTap: onTap, 
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blueGrey,
        ),
        child: Center(
          child: Text(
              
            // The Symbol is used here
            symbol, 
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
} */





// import 'package:flutter/material.dart';

// class Custombotton extends StatelessWidget {
//   const Custombotton({required this.symbol, required this.onTap});
//   final String symbol;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 50,
//         width: 400,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(18),
//           color: Colors.blue,
//         ),
//         child: Row(
//           children: [
//             Text("Get",
//               style: TextStyle(
//                   fontSize: 30, 
//                   fontWeight: FontWeight.bold, 
//                   color: Colors.brown),
//             ), Text("FetchUsers",
//               style: TextStyle(
//                   fontSize: 30, 
//                   fontWeight: FontWeight.bold, 
//                   color: Colors.brown),
//             ),
//           ],
//         ), ),
//       );
    
//   }
// }

