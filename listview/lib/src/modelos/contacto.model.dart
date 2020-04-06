import 'package:flutter/material.dart';

class ContactoModel {
  String correo;
  String nombre;
  ContactoModel({@required this.correo, @required this.nombre});
  ContactoModel.fromJson(Map<String, String> json) {
    this.correo = json['correo'];
    this.nombre = json['nombre'];
  }
}
