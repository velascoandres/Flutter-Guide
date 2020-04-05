import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
    static final String nombreRuta = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina Settings')),
      body: Container(
        child: Center(
          child: Text('Estamos en Settings'),
        ),
      ),
    );
  }
}
