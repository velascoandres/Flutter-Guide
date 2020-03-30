import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class Tarjeta extends StatelessWidget {
  final Widget titulo;
  final IconData icono;
  final MaterialAccentColor color;
  final double iconSize = 40.0;

  Tarjeta({
    @required this.titulo,
    @required this.icono,
    this.color = Colors.redAccent,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            this.titulo,
            Icon(
              this.icono,
              color: this.color,
              size: iconSize,
            )
          ],
        ),
      ),
    );
  }
}

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
