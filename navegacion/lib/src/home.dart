import 'package:flutter/material.dart';
import 'package:navegacion/src/bateria.dart';
import 'package:navegacion/src/settings.dart';

class Home extends StatelessWidget {
  static final String nombreRuta = '/home';

  Drawer obtenerDrawer(BuildContext context) {
    ListTile obtenerListTile(Icon icono, String descripcion, String ruta) {
      return ListTile(
        leading: icono,
        title: Text(descripcion),
        onTap: () {
          //  Navigator.of(context).pushNamed(ruta);
          Navigator.pushNamed(context, ruta);
        },
      );
    }

    ListView obtenerLista() {
      return ListView(
        children: <Widget>[
          obtenerListTile(
              Icon(Icons.settings), 'Settings', Settings.nombreRuta),
          obtenerListTile(Icon(Icons.home), 'Home', Home.nombreRuta),
          obtenerListTile(
              Icon(Icons.battery_alert), 'Bateria', Bateria.nombreRuta),
        ],
      );
    }

    return Drawer(
      child: obtenerLista(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina Home'),
      ),
      drawer: Drawer(
        child: this.obtenerDrawer(context),
      ),
      body: Container(
        child: Center(
          child: Text('Estamos en home'),
        ),
      ),
    );
  }
}
