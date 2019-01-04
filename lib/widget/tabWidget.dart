import 'package:flutter/material.dart';
import 'drawerWidget.dart';
import 'package:lexiang/model/tuchong_response.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TabbedScaffold extends StatelessWidget {
  TabbedScaffold(this.title, this.items);

  final String title;
  final List<FeedList> items;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      drawer: new DrawerWidget(),
      body: new GridView.count(
        primary: false,
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        children: buildGridTileList(context, items),
      ),
    );
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

List<Widget> buildGridTileList(BuildContext context, List<FeedList> items) {
  List<Widget> widgetList = new List();
  var length = items==null?0:items.length;
  for (int index = 0; index < length; index++) {
    FeedList item = items[index];
    List<Images> imageList = item.images;
    if (imageList.isNotEmpty) {
      Images image = imageList[0];
      String url = "https://photo.tuchong.com/" +
          image.userId.toString() +
          "/f/" +
          image.imgId.toString() +
          ".jpg";
      widgetList.add(getImage(context, url));
    }
    return widgetList;
  }
}
