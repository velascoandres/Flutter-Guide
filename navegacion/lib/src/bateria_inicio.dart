import 'package:flutter/material.dart';
import 'package:navegacion/src/bateria_hijo.dart';
import 'package:navegacion/src/rutas.dart';

import '../main.dart';

class BateriaInicio extends StatelessWidget {
  static final String nombreRuta = '/inicio';

  // Drawer generarDrawer(BuildContext context){
  //     ListTile generarListaTitulo (Icon icono, String descripcion, BuildContext context){

  //     }
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: rutasBaterial,
      navigatorKey: llaveRutaPrincipal,
      home: Navigator(
        key: llaveRutaBateria,
        initialRoute: '/hijo',
        onGenerateRoute: (settings) {
          return MaterialPageRoute(builder: (context){return BateriaHijo();});
        },
      ),
    );
  }
}
