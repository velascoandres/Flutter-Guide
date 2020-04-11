part of 'auth_bloc.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();
  @override
  List<Object> get props => [];
}

class ApplicacionInicializada extends AuthEvent{}

class Logeado extends AuthEvent{
  final String token;

  const Logeado({@required this.token});
  
  @override
  List<Object> get props => [token];
  @override
  String toString() => 'Loegado { token: $token }';
}

class DesLogeado extends AuthEvent {}
