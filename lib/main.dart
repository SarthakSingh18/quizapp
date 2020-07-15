import 'package:flutter/material.dart';
import 'package:quiz_app/page/questionPage.dart';
import 'package:quiz_app/page/routerPage.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Router(),
    );
  }
}
