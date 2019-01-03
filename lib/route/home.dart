import 'package:flutter/material.dart';
import 'package:lexiang/widget/tabWidget.dart';
import 'package:http/http.dart' as client;

class HomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => new MyHomePageState();
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    getData();
    return TabbedScaffold(title: '乐享');
  }

  getData() async {
    var api = 'https://api.tuchong.com/feed-app';
    try {
      final response = await client.get(api);
      if (response.statusCode == 200) {
          print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
