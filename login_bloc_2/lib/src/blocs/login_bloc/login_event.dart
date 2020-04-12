part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class CambioEmail extends LoginEvent {
  final String email;
  CambioEmail({@required this.email});

  @override
  List<Object> get props => [email];
}

class CambioPassword extends LoginEvent {
  final String password;
  CambioPassword({
    @required this.password,
  });

  @override
  List<Object> get props => [password];
}

class BotonLoginPresionado extends LoginEvent {
  final String email;
  final String password;

  const BotonLoginPresionado({
    @required this.email,
    @required this.password,
  });

  @override
  List<Object> get props => [email, password];

  @override
  String toString() =>
      'BotonLoginPresionado { email: $email, password: $password }';
}
