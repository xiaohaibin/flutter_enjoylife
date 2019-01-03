import 'package:flutter/material.dart';
import 'package:lexiang/route/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '乐享',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.amber,
      ),
      home: MyHomePage(title: '乐享'),
    );
  }
}
