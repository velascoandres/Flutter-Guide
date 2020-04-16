import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/login_bloc/login_bloc.dart';
import 'package:login_bloc_2/src/pantallas/registro_pantalla.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';
import 'package:login_bloc_2/src/widgets/formulario_login.dart';

class PantallaLogin extends StatelessWidget {
  final AuthRepositorio authRepositorio;

  PantallaLogin({
    Key key,
    @required this.authRepositorio,
  })  : assert(authRepositorio != null),
        super(key: key);

  Widget _generarBotonIrRegistro(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistroPantalla(),
          ),
        );
      },
      child: Text('Registrarse'),
      color: Colors.blueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: BlocProvider(
          create: (BuildContext context) {
            return LoginBloc(
              authRepositorio: this.authRepositorio,
            );
          },
          child: Column(
            children: <Widget>[
              FormularioLogin(),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
              ),
              _generarBotonIrRegistro(context),
            ],
          )),
    );
  }
}
