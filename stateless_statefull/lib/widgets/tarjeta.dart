import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
