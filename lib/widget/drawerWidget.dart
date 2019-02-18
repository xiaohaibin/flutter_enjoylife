import 'package:flutter/material.dart';
import 'package:lexiang/route/about.dart';
import 'package:lexiang/route/settings.dart';
import 'package:lexiang/route/sliverAppbar.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          new UserAccountsDrawerHeader(
            accountName: new Text('MR.Xiao'),
            accountEmail: new Text('xhb_199409@163.com'),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: Colors.amber,
              child: new FlutterLogo(size: 42.0),
            ),
          ),
//          new ListTile(
//            leading: const Icon(Icons.vertical_align_top),
//            title: const Text('Sliver Appbar'),
//            onTap: () {
//              Navigator.pop(context);
//              Navigator.push(context, new MaterialPageRoute<void>(
//                builder: (BuildContext context) {
//                  return new ContactsDemo();
//                },
//              ));
//            },
//          ),
//          new ListTile(
//            leading: const Icon(Icons.settings),
//            title: const Text('设置'),
//            onTap: () {
//              Navigator.pop(context);
//              Navigator.push(context, new MaterialPageRoute(
//                builder: (BuildContext context) {
//                  return new Settings();
//                },
//              ));
//            },
//          ),
//          new Divider(),
          new ListTile(
            leading: const Icon(Icons.info),
            title: const Text('关于'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context, new MaterialPageRoute(
                builder: (BuildContext context) {
                  return new About();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key key}) : super(key: key);

  @override
  _MyDrawerHeaderState createState() => new _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return new Semantics(
      label: 'Flutter',
      child: new DrawerHeader(

        padding: const EdgeInsets.all(0.0),
        child: new Container(
          color: Color(0x33000000),
          padding: const EdgeInsets.all(16.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FlutterLogo(
                size: 64.0,
              ),
              new Text(
                'To Start Login',
                style: new TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
