part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class ApplicacionInicializada extends AuthEvent {}

class Logeado extends AuthEvent {
  final String token;

  const Logeado({this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'Loegado { token: $token }';
}

class DesLogeado extends AuthEvent {}

// Cuando se registra un usuario
class UsuarioRegistrado extends AuthEvent {
  final Usuario usuario;

  UsuarioRegistrado({@required this.usuario});

  @override
  List<Object> get props => [usuario];

  @override
  String toString() => 'Usuario registrado { token: $usuario }';
}

// Cuando se confirma el registro
class RegistroUsuarioConfirmado extends AuthEvent {
  final String codigoConfirmacion;
  RegistroUsuarioConfirmado({@required this.codigoConfirmacion});

  @override
  List<Object> get props => [codigoConfirmacion];

  @override
  String toString() => 'Codigo confirmado { codigo: $props }';
}
