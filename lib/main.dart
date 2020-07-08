import 'package:flutter/material.dart';
import 'package:flutterfirebasebasicapp/pages/HomePagefirebase.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Firebase Basics',
      theme: ThemeData(

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePagefirebase(),
      debugShowCheckedModeBanner: false,
    );
  }
}
