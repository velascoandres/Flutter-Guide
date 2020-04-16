import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/registro_bloc/registro_bloc.dart';
import 'package:login_bloc_2/src/widgets/formulario_registro.dart';

class RegistroPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: BlocProvider(
        create: (BuildContext contexto) {
          return RegistroBloc();
        },
        child: SingleChildScrollView(
          child: Center(
            child: FormularioRegistro(),
          ),
        ),
      ),
    );
  }
}
