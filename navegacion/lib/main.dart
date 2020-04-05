import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:navegacion/src/app.dart';
import 'package:navegacion/src/rutas.dart';

final GlobalKey<NavigatorState> llaveRutaPrincipal =GlobalKey();
final GlobalKey<NavigatorState> llaveRutaBateria =GlobalKey();

void main(List<String> args) {
  runApp(MaterialApp(
    home: App(),
    routes: rutasPrincipal,
    navigatorKey: llaveRutaPrincipal,
  ));
}
