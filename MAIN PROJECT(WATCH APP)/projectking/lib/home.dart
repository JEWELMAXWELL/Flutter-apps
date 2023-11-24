import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projectking/BrandsPage.dart';
import 'package:projectking/DeliveryPage.dart';
import 'package:projectking/aboutdetails.dart';
import 'package:projectking/cartPage.dart';
import 'package:projectking/listviewproduct.dart';
import 'package:projectking/myaccount.dart';
import 'package:projectking/product_provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:projectking/settings.dart';
import 'package:projectking/signedup.dart';
import 'package:projectking/watchcategory.dart';
import 'package:projectking/watches.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//   Map<int, List<String>> colorImageMap = {
//   0: ['asset/watch 1red1.jpg', 'asset/watch 1blue1.jpg', 'asset/watch 1.jpg', 'asset/watch 1yellow1.jpg'],
//   1: ['asset/watch 1.jpg', 'asset/watch 2.jpg', 'asset/watch 3.jpg', 'asset/watch 4.jpg'],
//   2: ['asset/watch 5.jpg', 'asset/watch 6.jpg', 'asset/watch 7.jpg', 'asset/watch 8.jpg'],
//   // Add more entries for other watches as needed.
// };
List<Map<String, String>> ColorOptions = [
  {
    'Red': 'asset/watch 1red1.jpg',
    'Blue': 'asset/watch 1blue1.jpg',
    'Green': 'asset/watch 1.jpg',
    'Yellow': 'asset/watch 1yellow1.jpg',
  },
  {
    'Red': 'asset/watch 6.jpg',
    'Blue': 'asset/watch 6blue.jpg',
    'Green': 'asset/watch 6green.jpg',
    'Yellow': 'asset/watch 6yellow.jpg',
  },
  {
    'Red': 'asset/watch 2red.jpg',
    'Blue': 'asset/watch 2blue.jpg',
    'Green': 'asset/watch 2green.jpg',
    'Yellow': 'asset/watch 2yellow.jpg',
  },
   {
    'Red': 'asset/watch 3red.jpg',
    'Blue': 'asset/watch 3blue.jpg',
    'Green': 'asset/watch 3green.jpg',
    'Yellow': 'asset/watch 3yellow.jpg',
  }, {
    'Red': 'asset/watch 4red.jpg',
    'Blue': 'asset/watch 4blue.jpg',
    'Green': 'asset/watch 4green.jpg',
    'Yellow': 'asset/watch 4yellow.jpg',
  }, {
    'Red': 'asset/watch 5red.jpg',
    'Blue': 'asset/watch 5blue.jpg',
    'Green': 'asset/watch 5green.jpg',
    'Yellow': 'asset/watch 5yellow.jpg',
  },
  // Add more watches with their color options as needed.
];

//   Map<String, String> colorImageMapWatch1 = {
//   'Red': 'asset/watch 1red1.jpg',
//   'Blue': 'asset/watch 1blue1.jpg',
//   'Green': 'asset/watch 1.jpg',
//   'Yellow': 'asset/watch 1yellow1.jpg',
// };
// Map<String, String> colorImageMapWatch2 = {
//   'Red': 'asset/watch 1.jpg',
//   'Blue': 'asset/watch 2.jpg',
//   'Green': 'asset/watch 3.jpg',
//   'Yellow': 'asset/watch 4.jpg',
// };

// Map<String, String> colorImageMapWatch3 = {
//   'Red': 'asset/watch 5.jpg',
//   'Blue': 'asset/watch 6.jpg',
//   'Green': 'asset/watch 7.jpg',
//   'Yellow': 'asset/watch 8.jpg',
// };

// Map<String, String> colorImageMapWatch3 = {
//   'Red': 'asset/watch3_red.jpg',
//   'Blue': 'asset/watch3_blue.jpg',
//   'Green': 'asset/watch3_green.jpg',
//   'Yellow': 'asset/watch3_yellow.jpg',
// };

  List<Map<String, dynamic>> mywatch = [
    {"image": "asset/watch 1.jpg", "name": "PANERAI", "price": "500","rating": 4.5},
    {"image": "asset/watch 2.jpg", "name": "ADAMKIMMEL", "price": "700","rating": 4.9},
    {"image": "asset/watch 3.jpg", "name": "RIDER", "price": "800","rating": 6.5},
    {"image": "asset/watch 4.jpg", "name": "SEIKO", "price": "900","rating": 3.5},
    {"image": "asset/watch 5.jpg", "name": "CASIO", "price": "1500","rating": 7.5},
    {"image": "asset/watch 6.jpg", "name": "STEEL", "price": "2500","rating": 8.5},
  ];
  List<Map<String, dynamic>> ourswatch = [
    {"image": "asset/watch 12.jpg", "name": "ANDROID WATCH", "price": "500"},
    {"image": "asset/watch 13.jpg", "name": "APPLE WATCH", "price": "800"},
    {"image": "asset/watch 14.jpg", "name": "WRIST BAND", "price": "900"},
    {"image": "asset/watch 15.jpg", "name": "SIMPLE SMART WATCH", "price": "1200"},
    {"image": "asset/watch 16.jpg", "name": "GEAR WATCH", "price": "1700"},
    {"image": "asset/watch 17.jpg", "name": "SIMPLE WATCH", "price": "2300"},
  ]; //the values are passed to corresponding keys in the list for displaying image,imagename and price.
  List<Widget> filteredWidgets = [];
  
     TextEditingController searchController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userNameTextController = TextEditingController();
     List<Map<String, dynamic>> filteredWatches = [];


@override
  void initState() {
    super.initState();
    // Initialize the filtered results with all watches.
    filteredWatches = mywatch;
  }
   
  void performSearch(String query) {
  query = query.toLowerCase();
  setState(() {
  if (query.isEmpty) {
    // If the query is empty, reset the filteredWatches to include all items.
    
      filteredWatches = mywatch;
    
  } else {
    
    setState(() {
      filteredWatches = mywatch
          .where((watch) =>
              watch["name"].toLowerCase().contains(query) ||
              watch["price"].toLowerCase().contains(query))
          .toList();
    });
  }
  });

void _signOut(BuildContext context) async {
  //signout function which will delete the login information from firebase.
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Signedup()),
  );
}
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          Container(
            child: IconButton(
              onPressed: () {TextField(style: TextStyle());},
              icon: Icon(Icons.search),
            ),
          ),
           Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.1),
              child: Container(
                width: 100, // Adjust the width as needed
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                  onChanged: (query) {
                    performSearch(query); // Call the search function.
                  },)
                 ),
            ),
          ),
        ],
        
      ),
      drawer: Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("jewel"),
            accountEmail: Text("jewelmaxwell007@gmail.com"),
            currentAccountPicture: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccountPage( fullName: _userNameTextController.text,
          email: _emailTextController.text, favoriteWatches: [], )));
              }, //Displays drawerbar which is 3 line icon in which 6 items added in Listtile.
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.red),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: ListTile(
              title: Text("Home Page"),
              leading: Icon(Icons.home),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyAccountPage(fullName: _userNameTextController.text,
          email: _emailTextController.text, favoriteWatches: [],)),
              );
            },
            child: ListTile(
              title: Text("My Account"),
              leading: Icon(Icons.person),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage1()),
              );
            },
            child: ListTile(
              title: Text("My Order"),
              leading: Icon(Icons.shopping_basket),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WatchCategoryPage()),
              );
            },
            child: ListTile(
              title: Text("Catagories"),
              leading: Icon(Icons.dashboard),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            child: ListTile(
                title: Text("Settings"),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                )),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              );
            },
            child: ListTile(
              title: Text("About"),
              leading: Icon(
                Icons.help,
                color: Colors.green,
              ),
            ),
          ),
          InkWell(
            onTap: () => _signOut(context),
            child: ListTile(
              title: Text("Sign Out"),
              leading: Icon(Icons.exit_to_app),
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        //will help to open app in any screens.
        child: Column(children: [
           if (filteredWatches.isEmpty)
  // Display default content when there are no search results
  Text("Default content goes here")
else
  // Display search results
    if (searchController.text.isNotEmpty)
  Column(
    children: [
      Text("Search Results"),
      // Create a ListView or GridView to display search results
      ListView.builder(
        shrinkWrap: true,
        itemCount: filteredWatches.length,
        itemBuilder: (context, index) {
    //        Map<String, String> colorImageMap = {};
    // if (index == 0) {
    //   colorImageMap = colorImageMapWatch1;
    // } else if (index == 1) {
    //   colorImageMap = colorImageMapWatch2;
    // } else if (index == 2) {
    //   colorImageMap = colorImageMapWatch3;
    // }
          return   GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ProductDetailsScreen(product: filteredWatches[index],
                colorOptions: ColorOptions[index],
          //        colorOptions: [
          // colorImageMapWatch1,
          // colorImageMapWatch2,
          // colorImageMapWatch3,]
                // colorImageMapWatch1: colorImageMap,colorImageMapWatch2: colorImageMap,colorImageMapWatch3: colorImageMap
                ),
          ),
        );
      },
      child:
          ListTile(
            leading: Image.asset(
            filteredWatches[index]["image"],
            width: 50, // Adjust the width as needed
            height: 50, // Adjust the height as needed
          ),
            title: Text(filteredWatches[index]["name"]),
            subtitle: Text(filteredWatches[index]["price"]),
            // Add more widgets to display search results...
          ));        },
      ),]),
           
    
            if (searchController.text.isEmpty)
          Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: CarouselSlider(
                items: [
                  Image.asset(
                    'asset/watch 1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/watch 2.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/watch 3.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/watch 4.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'asset/watch 5.jpg',
                    fit: BoxFit.cover,
                  ),
                ],
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.easeInOut,
                ),
              )),
                if (searchController.text.isEmpty)
          SizedBox(height: 3),
            if (searchController.text.isEmpty)
          Text("Categories"),
          SizedBox(
            height: 3,
          ),
              if (searchController.text.isEmpty)
          Container(
            //shows 5 watches in horizontal list within the container area.
            height: 150,
            width: 500,
           
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Text(
                    "ANDROID WATCH",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                  Card(
                    //Display watches from list in indexed order and further navigates to its detailspage.
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen2(product: ourswatch[0],colorOptions: ColorOptions[0], ),
                          ),
                        );
                      },
                      child: Image(
                        image: AssetImage("asset/watch 12.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("APPLE WATCH",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen2(product: ourswatch[1],colorOptions: ColorOptions[1], ),
                          ),
                        );
                      },
                      child: Image(
                          image: AssetImage("asset/watch 13.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("WRIST BAND",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen2(product: ourswatch[2],colorOptions: ColorOptions[2], ),
                          ),
                        );
                      },
                      child: Image(
                          image: AssetImage("asset/watch 14.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("SIMPLE SMART WATCH",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                  Card(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailsScreen2(product: ourswatch[3],colorOptions: ColorOptions[3]),
                          ),
                        );
                      },
                      child: Image(
                          image: AssetImage("asset/watch 15.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("GEAR WATCH",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 14)),
                  Card(
                      child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen2(product: ourswatch[4],colorOptions: ColorOptions[4]),
                        ),
                      );
                    },
                    child: Image(
                        image: AssetImage("asset/watch 16.jpg"),
                        fit: BoxFit.cover),
                  )),
                ],
              ),
            
          ),
              if (searchController.text.isEmpty)
          SizedBox(
            height: 9,
          ),
              if (searchController.text.isEmpty)
          Text("Recent products"),
              if (searchController.text.isEmpty)
          SizedBox(height: 9),
              if (searchController.text.isEmpty)
          Container(
            height: 300,
            child: GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 7,
    mainAxisSpacing: 9,
    mainAxisExtent: 304,
  ),
  itemCount: mywatch.length,
  itemBuilder: (BuildContext context, int index) {
    
    // Define colorImageMap here and initialize it based on the current index.
    // Map<String, String> colorOptions= {};
    // if (index == 0) {
    //   colorOptions = colorImageMapWatch1;
    // } else if (index == 1) {
    //   colorOptions = colorImageMapWatch2;
    // } else if (index == 2) {
    //   colorOptions = colorImageMapWatch3;
    // }

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsScreen(
                  product: mywatch[index],
                  colorOptions: ColorOptions[index],
                  // colorOptions: [
                  //   colorImageMapWatch1,
                  //   colorImageMapWatch2,
                  //   colorImageMapWatch3,
                  // ],
                ),
              ),
            );
          },
          child: Container(
            height: 180,
            width: 180,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(mywatch[index]["image"]),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(mywatch[index]["name"]),
        SizedBox(height: 5),
        Text('Rs ' + mywatch[index]["price"].toString()),
        SizedBox(height: 5),
        RatingBar.builder(
          initialRating: mywatch[index]["rating"],
          minRating: 0,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            // You can handle rating updates here if needed
          },
        ),
      
    
  

      // GridView.builder(
      // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //   crossAxisCount: 2,
      //   crossAxisSpacing: 7,
      //   mainAxisSpacing: 9,
      //   mainAxisExtent: 304,
      // ),
      // itemCount: mywatch.length,
      // itemBuilder: (BuildContext context, int index) {
      //   List<String> colorImages = colorImageMap[index] ?? [];
      //   //  Map<String, String> colorImageMap = {};
      //           if (index == 0) {
      //             colorImageMap = colorImageMapWatch1;
      //           } else if (index == 1) {
      //             colorImageMap = colorImageMapWatch2;
      //           } else if (index == 2) {
      //             colorImageMap = colorImageMapWatch3;
      //           }
      //   return Column(
      //     children: [
      //       GestureDetector(
      //         onTap: () {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //                builder: (context) => ProductDetailsScreen(product: mywatch[index],
      //                 colorOptions: [
      //     colorImageMapWatch1,
      //     colorImageMapWatch2,
      //     colorImageMapWatch3,
      //   ],
      //               //  colorImageMapWatch1: colorImageMap,colorImageMapWatch2: colorImageMap,colorImageMapWatch3: colorImageMap
      //                ),
      //             ),
      //           );
      //         },
      //         child: Container(
      //           height: 180,
      //           width: 180,
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: AssetImage(mywatch[index]["image"]),
      //               fit: BoxFit.cover,
      //             ),
      //             borderRadius: BorderRadius.circular(5),
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 5),
      //       Text(mywatch[index]["name"]),
      //       SizedBox(height: 5),
      //       Text('Rs ' + mywatch[index]["price"].toString()),
      //       SizedBox(height: 5),
      //       RatingBar.builder(
      //     initialRating: mywatch[index]["rating"],
      //     minRating: 0,
      //     direction: Axis.horizontal,
      //     allowHalfRating: true,
      //     itemCount: 5,
      //     itemSize: 20,
      //     itemBuilder: (context, _) => Icon(
      //       Icons.star,
      //       color: Colors.amber,
      //     ),
      //     onRatingUpdate: (rating) {
      //       // You can handle rating updates here if needed
      //     },
      //   ),
          ],
        );
      },
    ),),])),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: 0,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WatchesPage(),
                ),
              );
            },
            icon: Icon(Icons.watch_outlined),
          ),
          label: 'Watches',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BrandsPage(),
                ),
              );
            },
            icon: Icon(Icons.watch_sharp),
          ),
          label: 'Brands',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DeliveryPage(),
                ),
              );
            },
            icon: Icon(Icons.local_shipping),
          ),
          label: 'Delivery',
        ),
      ],
    ),
        );
}

void _signOut(BuildContext context) async {
  //signout function which will delete the login information from firebase.
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => Signedup()),
  );
}
}


