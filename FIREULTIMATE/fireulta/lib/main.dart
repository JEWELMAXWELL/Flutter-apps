import 'package:firebase_core/firebase_core.dart';
import 'package:fireulta/firebase_options.dart';
import 'package:fireulta/firstpage.dart';
import 'package:fireulta/secondpage.dart';
import 'package:fireulta/update.dart';
import 'package:flutter/material.dart';

Future<void> main()async{ 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    routes: {
        '/':(context) => firstpage(),
        '/secondpage':(context) =>secondpage(),
        '/update':(context) => update(),



    },
    
    );
  }
}