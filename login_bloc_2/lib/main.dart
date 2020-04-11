import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/app.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/blocs/delegador_simple_bloc.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';

void main(List<String> args) {
  BlocSupervisor.delegate = DelegadorSimpleBloc();
  final authRespositorio = AuthRepositorio();
  runApp(
    BlocProvider(
      create: (context){
        return AuthBloc(authRepositorio: authRespositorio)
        ..add(ApplicacionInicializada());
      },
      child: App(
        authRepositorio: authRespositorio,
      ),
    )
  );
}