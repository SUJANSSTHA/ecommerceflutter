import 'package:ecommerceflutter/firebase_options.dart';
import 'package:ecommerceflutter/page/onbording.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'page/home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}
//use

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Onbording(),
      home: const Home(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
