import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.contacts,
              size: 170,
              color: Colors.orange,
            ),
            Padding(padding: EdgeInsets.all(10)),
            Center(
              child: Text('Contacts', style: TextStyle(color: Colors.orangeAccent),),
            ),
          ],
        ),
      )),
    );
  }
}
