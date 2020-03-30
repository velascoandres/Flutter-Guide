import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      // Barra de navegacion
      title: Text('Primera App'),
    ),
    body: Container(
      child: Center(
        child: Text(
          'Hola',
          style: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        print('Click');
      },
    ),
  ));
  runApp(app);
}
