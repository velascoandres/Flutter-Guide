import 'package:flutter/material.dart';
import 'package:stateless_statefull/widgets/tarjeta.dart';

class MyApp extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 32, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless widget'),
      ),
      body: Container(
        child: Column(
          // Widgets en distintas filas
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Los w. ocupararan toda la fila
          children: <Widget>[
            Tarjeta(
              titulo: Text(
                'Andres',
                style: textStyle,
              ),
              icono: Icons.account_balance,
              color: Colors.blueAccent,
            ),
            Tarjeta(
              titulo: Text('Juan Pecados', style: textStyle),
              icono: Icons.accessible_forward,
              color: Colors.lightBlueAccent,
            ),
            Tarjeta(
              titulo: Text(
                'Terry',
                style: textStyle,
              ),
              icono: Icons.android,
              color: Colors.lightGreenAccent,
            ),
          ],
        ),
      ),
    );
  }
}