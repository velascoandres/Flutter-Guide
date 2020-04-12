part of 'login_bloc.dart';

@immutable
class LoginState  {
  final bool emailValido;
  final bool passwordValido;
  final bool estaConsultando;
  final bool estaExitoso;
  final bool estaFallido;


  LoginState(
    {
      @required this.emailValido,
      @required this.passwordValido,
      @required this.estaConsultando,
      @required this.estaExitoso,
      @required this.estaFallido,
    }
  );

  bool get estaFormularioValido => emailValido && passwordValido;

  factory LoginState.vacio() {
    return LoginState(
      emailValido: true,
      passwordValido: true,
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  factory LoginState.cargando() {
    return LoginState(
      emailValido: true,
      passwordValido: true,
      estaConsultando: true,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  factory LoginState.fallido() {
    return LoginState(
      emailValido: true,
      passwordValido: true,
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: true,
    );
  }

  factory LoginState.exito() {
    return LoginState(
      emailValido: true,
      passwordValido: true,
      estaConsultando: false,
      estaExitoso: true,
      estaFallido: false,
    );
  }

  LoginState actualizar({
    bool emailValido,
    bool passwordValido,
  }) {
    return copiar(
      emailValido: emailValido,
      passwordValido: passwordValido,
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  LoginState copiar({
    bool emailValido,
    bool passwordValido,
    bool estaConsultando,
    bool estaExitoso,
    bool estaFallido,
  }) {
    return LoginState(
      emailValido: emailValido ?? this.emailValido,
      passwordValido: passwordValido ?? this.passwordValido,
      estaConsultando: estaConsultando ?? this.estaConsultando,
      estaExitoso: estaExitoso ?? this.estaExitoso,
      estaFallido: estaFallido ?? this.estaFallido,
    );
  }

  @override
  String toString() {
    return '''LoginState {
      emailValido: $emailValido,
      passwordValido: $passwordValido,
      estaConsultando: $estaConsultando,
      estaExitoso: $estaExitoso,
      estaFallido: $estaFallido,
    }''';
  }
}
