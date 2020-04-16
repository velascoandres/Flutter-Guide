import 'package:flutter/material.dart';
import 'dart:async';

Widget generarCampoCorreo({
  @required dynamic valorEstado,
  @required Function listenerCb,
  @required TextEditingController controlador,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Correo',
      hintText: 'Ingresa tu correo',
    ),
    autovalidate: true,
    autocorrect: false,
    controller: controlador,
    keyboardType: TextInputType.emailAddress,
    onChanged: listenerCb,
    validator: (_) {
      return valorEstado ? null : 'Email incorrecto';
    },
  );
}

Widget generarCampoPassword({
  @required dynamic valorEstado,
  @required Function listenerCb,
  @required TextEditingController controlador,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: 'Password',
      hintText: 'Ingresa tu contraseña',
    ),
    autovalidate: true,
    autocorrect: false,
    controller: controlador,
    obscureText: true,
    onChanged: listenerCb,
    validator: (_) {
      return valorEstado != '' ? valorEstado : '';
    },
  );
}

Widget generarCampoNumerico({
  @required dynamic valorEstado,
  @required String textoLabel,
  @required String textoAyuda,
  @required Function listenerCb,
  @required TextEditingController controlador,
  bool esTelefono = true,
  String valorInicial,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: textoLabel,
      hintText: textoAyuda,
    ),
    autovalidate: true,
    controller: controlador,
    initialValue: valorInicial,
    autocorrect: false,
    onChanged: listenerCb,
    keyboardType: esTelefono ? TextInputType.phone : TextInputType.number,
    validator: (_) {
      return valorEstado != '' ? valorEstado : '';
    },
  );
}

Widget generarCampoTexto({
  @required dynamic valorEstado,
  @required String textoLabel,
  @required String textoAyuda,
  @required Function listenerCb,
  @required TextEditingController controlador,
  bool textoLargo = false,
  String valorInicial,
}) {
  return TextFormField(
    decoration: InputDecoration(
      labelText: textoLabel,
      hintText: textoAyuda,
    ),
    autovalidate: true,
    initialValue: valorInicial,
    controller: controlador,
    onChanged: listenerCb,
    keyboardType: textoLargo ? TextInputType.multiline : TextInputType.text,
    autocorrect: false,
    validator: (_) {
      return valorEstado != '' ? valorEstado : '';
    },
  );
}

Widget generarCampoFecha({
  @required BuildContext context,
  @required dynamic valorEstado,
  @required String textoLabel,
  @required String textoAyuda,
  @required Function listenerCb,
  @required TextEditingController controlador,
  String valorInicial,
}) {
  var fecha = valorInicial != null ? valorInicial : null;

  return Column(
    children: <Widget>[
      TextFormField(
        decoration: InputDecoration(
          enabled: false,
          hintText: textoAyuda,
          labelText: textoLabel,
        ),
        onTap: () async {
          fecha = (await obtenerFecha(context)) as String;
        },
        autocorrect: false,
        autovalidate: true,
        controller: controlador,
        initialValue: fecha,
        onChanged: listenerCb,
        validator: (_) {
          return valorEstado != '' ? valorEstado : '';
        },
      ),
    ],
  );
}

Future<DateTime> obtenerFecha(BuildContext context) {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2018),
    lastDate: DateTime(2030),
    builder: (BuildContext context, Widget child) {
      return Theme(
        data: ThemeData.light(),
        child: child,
      );
    },
  );
}
