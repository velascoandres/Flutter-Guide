 import 'package:flutter/material.dart';
import 'package:navegacion/src/bateria.dart';
import 'package:navegacion/src/bateria_hijo.dart';
import 'package:navegacion/src/settings.dart';

import 'home.dart';

final Map<String, WidgetBuilder> rutasPrincipal = {
      Settings.nombreRuta : (BuildContext context) => Settings(),
      Home.nombreRuta: (BuildContext context) => Home(),
      Bateria.nombreRuta:   (BuildContext context) => Bateria(),
};


final Map<String, WidgetBuilder> rutasBaterial = {
      BateriaHijo.nombreRuta : (BuildContext context) => BateriaHijo(),
};