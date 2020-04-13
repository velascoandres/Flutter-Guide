import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc_2/src/blocs/validadores/usuario_validatores.dart';
import 'package:login_bloc_2/src/modelos/usuario_model.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

part 'registro_event.dart';
part 'registro_state.dart';

class RegistroBloc extends Bloc<RegistroEvent, RegistroState>
    with UsuarioValidadores {
  @override
  RegistroState get initialState => RegistroState.vacio();

  @override
  Stream<RegistroState> transformEvents(
    events,
    transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! CambioCorreo &&
          event is! CambioPassword &&
          event is! CambioNombres &&
          event is! CambioApellidos &&
          event is! CambioFechaNacimiento &&
          event is! CambioTelefono);
    });
    final debounceStream = events.where((event) {
      return (event is CambioCorreo || event is CambioPassword || event is CambioNombres ||
          event is CambioApellidos ||
          event is CambioFechaNacimiento ||
          event is CambioTelefono);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<RegistroState> mapEventToState(
    RegistroEvent evento,
  ) async* {
    if (evento is CambioPassword) {
      yield* this._mapCambioPasswordToState(evento.password);
    }
    if (evento is CambioCorreo) {
      yield* this._mapCambioEmailToState(evento.correo);
    }
    if (evento is CambioTelefono) {
      yield* this._mapCambioNombresToState(evento.telefono);
    }
    if (evento is CambioNombres) {
      yield* this._mapCambioApellidosToState(evento.nombres);
    }
    if (evento is CambioApellidos) {
      yield* this._mapCambioTelefono(evento.apellidos);
    }
    if (evento is CambioFechaNacimiento) {
      yield* this._mapCambioFechaNacimiento(evento.fechaNacimiento);
    }
    if (evento is PresionadoBotonRegistrado) {
      yield* this._mapPresionoBotonRegistrarToState(evento.usuario);
    }
  }

  Stream<RegistroState> _mapCambioEmailToState(String email) async* {
    yield state.actualizar(
      emailValido: validarEmailStr(email),
    );
  }

  Stream<RegistroState> _mapCambioPasswordToState(String password) async* {
    yield state.actualizar(
      passwordValido: validarPasswordStr(password),
    );
  }

  Stream<RegistroState> _mapCambioNombresToState(String nombres) async* {
    yield state.actualizar(
      nombresValidos: validarSoloLetras(nombres),
    );
  }

  Stream<RegistroState> _mapCambioApellidosToState(String apellidos) async* {
    yield state.actualizar(
      apellidosValidos: validarSoloLetras(apellidos),
    );
  }

  Stream<RegistroState> _mapCambioTelefono(String telefono) async* {
    yield state.actualizar(
      telefonoValido: validarTelefono(telefono),
    );
  }

  Stream<RegistroState> _mapCambioFechaNacimiento(
      String fechaNacimiento) async* {
    yield state.actualizar(
      fechaNacimientoValida: '',
    );
  }

  Stream<RegistroState> _mapPresionoBotonRegistrarToState(
      Usuario usuario) async* {
    yield RegistroState.cargando();
    try {
      // await authRepositorio.autenticar(email: email, password: password);
      yield RegistroState.exito();
    } catch (_) {
      yield RegistroState.fallido();
    }
  }
}
