import 'package:flutter/material.dart';
import 'package:listview/src/modelos/contacto.model.dart';
import 'package:listview/src/widgets/item-contacto.dart';

class Contacto extends StatefulWidget {
  @override
  _ContactoState createState() => _ContactoState();
}

class _ContactoState extends State<Contacto> {
  obtenerContactos() {
    return <ContactoModel>[
      ContactoModel(correo: 'correo@gmail.com', nombre: 'Juan Pecados'),
      ContactoModel(correo: 'juan@gmail.com', nombre: 'Max Power'),
      ContactoModel(correo: 'pedro@gmail.com', nombre: 'Jhony Sins'),
      ContactoModel(correo: 'correo@gmail.com', nombre: 'Pedro Pecados'),
      ContactoModel(correo: 'juan@gmail.com', nombre: 'Earnest Power'),
      ContactoModel(correo: 'pedro@gmail.com', nombre: 'George Sins'),
      ContactoModel(correo: 'correo@gmail.com', nombre: 'Mia Pecados'),
      ContactoModel(correo: 'juan@gmail.com', nombre: 'Khalifa Power'),
      ContactoModel(correo: 'pedro@gmail.com', nombre: 'Shasha Sins'),
      ContactoModel(correo: 'correo@gmail.com', nombre: 'Juan Pecados'),
      ContactoModel(correo: 'juan@gmail.com', nombre: 'Max Power'),
      ContactoModel(correo: 'pedro@gmail.com', nombre: 'Jhony Sins'),
    ];
  }

  List<ItemContacto> construirListaContactos() {
    return obtenerContactos()
        .map<ItemContacto>(
          (ContactoModel contacto) => ItemContacto(
            contactoModel: contacto,
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contactos'),
      ),
      body: ListView(
        children: <Widget>[
          ...construirListaContactos()
        ],
        
      ),
    );
  }
}
