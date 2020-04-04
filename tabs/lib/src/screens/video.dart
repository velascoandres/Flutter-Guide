import 'package:flutter/material.dart';

class Video extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.videocam,
                size: 170,
                color: Colors.green,
              ),
              Padding(padding: EdgeInsets.all(10)),
              Center(
                child: Text('Video'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
