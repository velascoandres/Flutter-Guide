import 'package:flutter/material.dart';
import 'package:navegacion/src/rutas.dart';

class Bateria extends StatelessWidget {
  static final String nombreRuta = '/bateria';

  // Drawer generarDrawer(BuildContext context){
  //     ListTile generarListaTitulo (Icon icono, String descripcion, BuildContext context){
        
  //     }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Pagina Bateria')),
        body: Container(
          child: Center(
            child: Text('Estamos en bateria'),
          ),
        ),
      );
  }
}
