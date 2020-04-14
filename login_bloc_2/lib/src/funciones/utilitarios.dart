import 'package:flutter/material.dart';

void mostrarSnakBarError(BuildContext context) {
  Scaffold.of(context).showSnackBar(
    SnackBar(
      content: Text('Formulario invalido'),
      backgroundColor: Colors.red,
    ),
  );
}

void mostrarSnackBar({@required BuildContext context, String mensaje = ''}){
  Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(mensaje),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
}
