import 'package:flutter/material.dart';
import 'package:navegacion/src/home.dart';
import 'package:navegacion/src/screens/segunda_pantalla.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void irSegundaPantalla() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SegundaPantalla(),
      ),
    );
  }

  void irAPaginaConDrawner() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Home(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera pantalla'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Ir a Segunda pantalla'),
              onPressed: this.irSegundaPantalla,
            ),
            RaisedButton(
              child: Text('Ir a Drawer'),
              onPressed: this.irAPaginaConDrawner,
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
