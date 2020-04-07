import 'package:flutter/material.dart';
import 'package:formularios/src/pantallas/login.screen.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inciar Sesion',
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Formulario'),
        // ),
        body: LoginScreen(),
      ),
    );
  }
}
