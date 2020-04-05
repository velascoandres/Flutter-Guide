import 'package:flutter/material.dart';

class BateriaHijo extends StatelessWidget {
    static final String nombreRuta = '/hijo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hijo de bateria')),
      body: Container(
        child: Center(
          child: Text('Estamos en el hijo de bateria'),
        ),
      ),
    );
  }
}
