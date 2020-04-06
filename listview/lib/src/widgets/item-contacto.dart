import 'package:flutter/material.dart';
import 'package:listview/src/modelos/contacto.model.dart';

class ItemContacto extends StatelessWidget {
  final ContactoModel contactoModel;

  ItemContacto({@required this.contactoModel}) : super();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(contactoModel.nombre.substring(0,1)),
      ),
      title: Text(contactoModel.nombre),
      subtitle: Text(contactoModel.correo),
    );
  }
}
