
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
      body: new ListView.builder(
            itemCount: items == null ? 0 : items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              List<Images> imageList = item.images;
              if (imageList.isNotEmpty) {
                Images image = imageList[0];
                final url = "https://photo.tuchong.com/" +
                    image.userId.toString() +
                    "/f/" +
                    image.imgId.toString() +
                    ".jpg";
                return getImage(context, url);
              }
            },
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
    height: MediaQuery.of(context).size.width,
    width: MediaQuery.of(context).size.width,
  );
}
