part of 'login_bloc.dart';


abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object> get props => [];
}

// Estado inicial del formulario de login
class LoginInicio extends LoginState {}

// Estado cuando el formulario de login se encuentra validando las credenciales
class LoginCargando extends LoginState {}

// Estado cuando hay un error en el formulario de login
class LoginFallido extends LoginState {
  final String error;

  const LoginFallido({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'Login Fallido { error: $error }';
}