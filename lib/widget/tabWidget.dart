import 'package:flutter/material.dart';
import 'drawerWidget.dart';

class TabbedScaffold extends StatelessWidget {
  TabbedScaffold({this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      drawer: new DrawerWidget(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Scaffold.of(context)
              .showSnackBar(new SnackBar(content: new Text('Show Snackbar')));
        },
        child: new Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
