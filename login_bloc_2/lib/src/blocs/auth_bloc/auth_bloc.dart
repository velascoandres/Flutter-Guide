import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc_2/src/modelos/usuario_model.dart';
import 'package:meta/meta.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepositorio authRepositorio;

  AuthBloc({
    @required this.authRepositorio,
  }) : assert(authRepositorio != null);

  @override
  AuthState get initialState => AuthSinInicializar();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent evento,
  ) async* {
    if (evento is ApplicacionInicializada) {
      final bool tieneToken = await authRepositorio.tieneToken();
      if (tieneToken) {
        yield AuthAuntentificado();
      } else {
        yield AuthSinAutentificar();
      }
    }
    if (evento is Logeado) {
      yield AuthCargando();
      await authRepositorio.guardarToken(evento.token);
      yield AuthAuntentificado();
    }
    if (evento is DesLogeado) {
      yield AuthCargando();
      await authRepositorio.borrarToken();
      yield AuthSinAutentificar();
    }

    if (evento is UsuarioRegistrado) {
      yield AuthCargando();
      try {
        await authRepositorio.registrarUsuario(evento.usuario);
        yield AuthEsperandoConfirmacionCorreo();
      } catch (eror) {
        yield AuthInformacionUsuarioRechazada();
      }
    }

    if (evento is RegistroUsuarioConfirmado) {
      yield AuthCargando();
      try {
        bool codigoValido =  await authRepositorio.verificarCodigoConfirmacion(evento.codigoConfirmacion);
        if (codigoValido){
          yield AuthAuntentificado();
        } else {
          yield AuthCodigoExpirado();
        }
      } catch (error) {
        yield AuthFalloLogin();
      }
    }
  }
}
