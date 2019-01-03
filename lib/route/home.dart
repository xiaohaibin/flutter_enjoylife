import 'package:flutter/material.dart';

//import 'package:lexiang/widget/tabWidget.dart';
import 'package:http/http.dart' as client;
import 'package:lexiang/model/tuchong_response.dart';
import 'dart:convert';
import 'package:lexiang/widget/tabWidget.dart';

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
  List<FeedList> feedList = new List();

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return TabbedScaffold('乐享', feedList);
  }

  getData() async {
    var api = 'https://api.tuchong.com/feed-app';
    try {
      final response = await client.get(api);
      if (response.statusCode == 200) {
        print(response.body);
        TuchongRespon tuchongRespon =
            TuchongRespon.fromJson(json.decode(response.body));
        setState(() {
          feedList.addAll(tuchongRespon.feedList);
        });
      } else {
        throw new Exception("http error:" + response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
