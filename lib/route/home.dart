import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:lexiang/model/tuchong_response.dart';
import 'package:lexiang/widget/drawerWidget.dart';
import 'package:lexiang/http/HttpController.dart';

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
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('图虫摄影'),
        ),
        drawer: new DrawerWidget(),
        body: new RefreshIndicator(
            color: Colors.blue,
            key: _refreshIndicatorKey,
            child: new GridView.builder(
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  FeedList item = feedList[index];
                  List<Images> imageList = item.images;
                  if (imageList.isNotEmpty) {
                    Images image = imageList[0];
                    String url = "https://photo.tuchong.com/" +
                        image.userId.toString() +
                        "/f/" +
                        image.imgId.toString() +
                        ".jpg";
                    return getImage(context, url);
                  }
                },
                itemCount: feedList.length),
            onRefresh: handleRefresh));
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

  Future<Null> handleRefresh() async {
    final Completer<Null> completer = new Completer<Null>();
    var api = 'https://api.tuchong.com/feed-app';
    try {
      final response = await client.get(api);
      if (response.statusCode == 200) {
        completer.complete(null);
        print(response.body);
        TuchongRespon tuchongRespon =
            TuchongRespon.fromJson(json.decode(response.body));
        setState(() {
          feedList.clear();
          feedList.addAll(tuchongRespon.feedList);
        });
      } else {
        completer.completeError(null);
        throw new Exception("http error:" + response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}

//列表中图片加载
getImage(BuildContext context, String imgUrl) {
  return new CachedNetworkImage(
    imageUrl: imgUrl,
    errorWidget: new Icon(Icons.error),
    fit: BoxFit.cover,
    height: MediaQuery.of(context).size.width / 2,
    width: MediaQuery.of(context).size.width / 2,
  );
}
