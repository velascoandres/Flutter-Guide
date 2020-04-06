import 'package:flutter/material.dart';
import 'package:lista_infinita/src/pantallas/palabras_favoritas.lista.dart';

final Map<String, Widget Function(BuildContext) > rutas = {
  PalabrasFavoritas.nombreRuta : (context) => PalabrasFavoritas(),
};