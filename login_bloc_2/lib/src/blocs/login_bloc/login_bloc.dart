import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:login_bloc_2/src/blocs/validadores/usuario_validatores.dart';
import 'package:login_bloc_2/src/repositorios/auth_repositorio.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with UsuarioValidadores {
  final AuthRepositorio authRepositorio;

  LoginBloc({
    @required this.authRepositorio,
  }) : assert(authRepositorio != null);
  
  @override
  LoginState get initialState => LoginState.vacio();

  @override
  Stream<LoginState> transformEvents(
    events,
    transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! CambioEmail && event is! CambioPassword);
    });
    final debounceStream = events.where((event) {
      return (event is CambioEmail || event is CambioPassword);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent evento,
  ) async* {
    if (evento is CambioEmail) {
      yield* this._mapCambioEmailToState(evento.email);
    }
    if (evento is CambioPassword) {
      yield* this._mapCamioPasswordToState(evento.password);
    }
    if (evento is BotonLoginPresionado) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: evento.email, password: evento.password);
    }
  }

  Stream<LoginState> _mapCambioEmailToState(String email) async* {
    yield state.actualizar(
      emailValido: validarEmail(email),
    );
  }

  Stream<LoginState> _mapCamioPasswordToState(String password) async* {
    yield state.actualizar(
      passwordValido: validarPassword(password),
    );
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.cargando();
    try {
      await authRepositorio.autenticar(email: email, password: password);
      yield LoginState.exito();
    } catch (_) {
      yield LoginState.fallido();
    }
  }
}
