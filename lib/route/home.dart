import 'dart:async';
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
  dynamic type = 'refresh';
  bool isLoading = false; // 是否正在请求数据中
  bool _hasMore = true; // 是否还有更多数据可加载
  dynamic page = 1;
  dynamic posId = 0;
  final ScrollController _scrollController = new ScrollController();
  List<FeedList> feedList = new List();

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    getData();
    _scrollController.addListener(() {
      ///判断当前滑动位置是不是到达底部，触发加载更多回调
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        type = 'loadmore';
        getData();
      }
    });
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
                controller: _scrollController, //用于监听是否滑到最底部
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemBuilder: (BuildContext context, int index) {
                  String url;
                  if (index < feedList.length) {
                    FeedList item = feedList[index];
                    List<Images> imageList = item.images;
                    if (imageList.isNotEmpty) {
                      Images image = imageList[0];
                      url = "https://photo.tuchong.com/" +
                          image.userId.toString() +
                          "/f/" +
                          image.imgId.toString() +
                          ".jpg";
                      return getImage(context, url);
                    }
                  } else {
                    return _buildProgressIndicator(); //展示加载loading框
                  }
                },
                itemCount: feedList.length + 1),
            onRefresh: handleRefresh));
  }

  getData() {
    var api = 'https://api.tuchong.com/feed-app';
    Map<String, String> map = new Map();
    map["page"] = page.toString();
    map["type"] = type;
    if (posId != 0) {
      map["post_id"] = posId.toString();
      print("==post_id" + posId.toString());
      print("==page" + page.toString());
    }
    HttpController.get(api, params: map).then((data) {
      print(data);
      TuchongRespon tuchongRespon = TuchongRespon.fromJson(json.decode(data));
      setState(() {
        if (type == 'refresh') {
          feedList = [];
        }
        feedList.addAll(tuchongRespon.feedList);
        posId =
            tuchongRespon.feedList[tuchongRespon.feedList.length - 1].postId;
      });
    });
  }

  Future<void> handleRefresh() {
    final Completer<void> completer = new Completer<void>();
    Timer(const Duration(seconds: 1), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      page = 1;
      type = 'refresh';
      posId = 0;
      getData();
    });
  }

  /*
  * 上提加载loading的widget
  * */
  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
          child: Column(
        children: <Widget>[
          new Opacity(
            opacity: 1.0,
            child: new CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.blue)),
          ),
          SizedBox(height: 20.0),
          Text(
            '加载中...',
            style: TextStyle(fontSize: 14.0),
          )
        ],
      )
          //child:
          ),
    );
  }
}

//列表中图片加载
getImage(BuildContext context, String imgUrl) {
  return new GestureDetector(
      onTap: () {
        Navigator.push(context, new MaterialPageRoute(builder: (context) {
          return new CachedNetworkImage(
            imageUrl: imgUrl,
            errorWidget: new Icon(Icons.error),
            fit: BoxFit.contain,
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
          );
        }));
      },
      child: new CachedNetworkImage(
//    fadeInDuration: const Duration(seconds: 300),
        imageUrl: imgUrl,
        errorWidget: new Icon(Icons.error),
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.width / 2,
        width: MediaQuery.of(context).size.width / 2,
      ));
}
