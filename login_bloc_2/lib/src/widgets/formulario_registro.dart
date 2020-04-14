import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/blocs/registro_bloc/registro_bloc.dart';
import 'package:login_bloc_2/src/funciones/camposFormulario.dart';
import 'package:login_bloc_2/src/funciones/utilitarios.dart';

class FormularioRegistro extends StatelessWidget {
  RegistroBloc _registroBloc;

  _escucharEmail(String correo){
    _registroBloc.add(CambioCorreo(correo: correo));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegistroBloc, RegistroState>(
      listener: (BuildContext context, RegistroState state) {
        if (state.estaConsultando) {
          mostrarSnackBar(context: context, mensaje: 'Registrando...');
        }
        if (state.estaExitoso) {
          BlocProvider.of<AuthBloc>(context).add(Logeado());
        }

        if (state.estaFallido) {
          mostrarSnakBarError(context);
        }
      },
      child: BlocBuilder<RegistroBloc, RegistroState>(
          builder: (BuildContext context, RegistroState state) {
        return Container(
          padding: EdgeInsets.all(20),
          child: Form(
            child: Column(
              children: <Widget>[
                generarCampoCorreo(
                  valorEstado: state.emailValido,
                  listenerCb: _escucharEmail,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
