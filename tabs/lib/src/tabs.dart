import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabs/src/screens/contact.dart';
import 'package:tabs/src/screens/home.dart';
import 'package:tabs/src/screens/video.dart';

class MyTabs extends StatefulWidget {
  @override
  _MyTabsState createState() => _MyTabsState();
}

class _MyTabsState extends State<MyTabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        bottomNavigationBar: Material(
          color: Colors.blueAccent,
          child: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.ondemand_video),
              ),
              Tab(
                icon: Icon(Icons.contacts),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text('Tabs'),
        ),
        body: Container(
          child: Center(
            child: TabBarView(
              children: <Widget>[
                Home(),
                Video(),
                Contacts(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
