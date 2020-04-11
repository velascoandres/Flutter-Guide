part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class BotonLoginPresionado extends LoginEvent {
  final String nombreUsuario;
  final String password;

  const BotonLoginPresionado({
    @required this.nombreUsuario,
    @required this.password,
  });

  @override
  List<Object> get props => [nombreUsuario, password];

  @override
  String toString() =>
      'BotonLoginPresionado { username: $nombreUsuario, password: $password }';
}