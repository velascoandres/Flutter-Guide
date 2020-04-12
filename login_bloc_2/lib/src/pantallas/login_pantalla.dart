import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/blocs/login_bloc/login_bloc.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';
import 'package:login_bloc_2/src/widgets/formulario_login.dart';

class PantallaLogin extends StatelessWidget {
  final AuthRepositorio authRepositorio;

  PantallaLogin({
    Key key,
    @required this.authRepositorio,
  })  : assert(authRepositorio != null),
        super(key: key);

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
        child: FormularioLogin(),
      ),
    );
  }
}
