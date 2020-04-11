import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/pantallas/inicio_pantalla.dart';
import 'package:login_bloc_2/src/pantallas/login_pantalla.dart';
import 'package:login_bloc_2/src/pantallas/slash_pantalla.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';
import 'package:login_bloc_2/src/widgets/indicador_cargando.dart';

class App extends StatelessWidget {
  final AuthRepositorio authRepositorio;

  App({Key key, @required this.authRepositorio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state){
          if (state is AuthSinInicializar){
            return SplashPage();
          }
          if (state is AuthSinAutentificar){
            return PantallaLogin(
              authRepositorio: this.authRepositorio,
            );
          }
          if (state is AuthAuntentificado){
            return InicioPantalla();
          }
          if (state is AuthCargando){
            return IndicadorCargando();
          }
        },
      )
    );
  }
}