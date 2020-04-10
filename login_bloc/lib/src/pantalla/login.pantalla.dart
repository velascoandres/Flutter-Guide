import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
import 'package:provider/provider.dart';

class PantallaLogin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<Bloc>(context);
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          campoCorreo(bloc),
          campoPassword(bloc),
          Container(
            margin: EdgeInsets.only(top: 25),
          ),
          botonSubmit(),
        ],
      ),
    );
  }

  Widget campoCorreo(Bloc bloc) {
    return StreamBuilder(
      // Volver a renderizar el widget en pantalla
      stream: bloc.correo,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email',
            errorText: snapshot.error,
          ),
          onChanged: bloc.cambiarEmail,
        );
      },
    );
  }

  Widget campoPassword(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'ingresa tu clave',
            labelText: 'Contraseña',
            errorText: snapshot.error,
          ),
          onChanged: bloc.cambiarPassword,
        );
      },
    );
  }

  Widget botonSubmit() {
    return RaisedButton(
      child: Text('Enviar'),
      onPressed: () {},
    );
  }
}
