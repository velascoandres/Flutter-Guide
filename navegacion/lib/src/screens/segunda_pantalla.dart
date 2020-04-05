import 'package:flutter/material.dart';

class SegundaPantalla extends StatelessWidget {
  static final String nombreRuta = '/segunda';

  @override
  Widget build(BuildContext context) {
    void irPrimeraPantalla() {
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Segunda pantalla'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Regresar a primera pantalla'),
          onPressed: irPrimeraPantalla,
        ),
      ),
    );
  }
}
