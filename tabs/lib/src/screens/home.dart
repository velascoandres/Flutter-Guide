import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home,
              size: 170,
              color: Colors.black,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child: Text('Home'),
            ),
          ],
        ),
      )),
    );
  }
}
