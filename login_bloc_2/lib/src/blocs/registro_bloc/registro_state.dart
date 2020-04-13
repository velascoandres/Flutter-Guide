part of 'registro_bloc.dart';

@immutable
class RegistroState  {
  final String emailValido;
  final String passwordValido;
  final String nombresValidos;
  final String apellidosValidos;
  final String telefonoValido;
  final String fechaNacimientoValida;
  final bool estaConsultando;
  final bool estaExitoso;
  final bool estaFallido;


  RegistroState( 
    {
      @required this.emailValido,
      @required this.passwordValido,
      @required this.estaConsultando,
      @required this.estaExitoso,
      @required this.estaFallido,
      @required this.apellidosValidos,
      @required this.nombresValidos,
      @required this.fechaNacimientoValida,
      @required this.telefonoValido,
    }
  );

  bool get estaFormularioValido => emailValido != '' && passwordValido != '' && apellidosValidos != '' && telefonoValido != '' && fechaNacimientoValida != '';

  factory RegistroState.vacio() {
    return RegistroState(
      emailValido: '',
      passwordValido: '',
      nombresValidos: '',
      apellidosValidos: '',
      telefonoValido: '',
      fechaNacimientoValida: '',
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  factory RegistroState.cargando() {
    return RegistroState(
      emailValido: '',
      nombresValidos: '',
      apellidosValidos: '',
      telefonoValido: '',
      fechaNacimientoValida: '',
      passwordValido: '',
      estaConsultando: true,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  factory RegistroState.fallido() {
    return RegistroState(
      emailValido: '',
      nombresValidos: '',
      apellidosValidos: '',
      telefonoValido: '',
      fechaNacimientoValida: '',
      passwordValido: '',
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: true,
    );
  }

  factory RegistroState.exito() {
    return RegistroState(
      emailValido: '',
      nombresValidos: '',
      apellidosValidos: '',
      telefonoValido: '',
      fechaNacimientoValida: '',
      passwordValido: '',
      estaConsultando: false,
      estaExitoso: true,
      estaFallido: false,
    );
  }

  RegistroState actualizar({
    String emailValido,
    String  passwordValido,
    String nombresValidos,
    String  apellidosValidos,
    String  telefonoValido,
    String fechaNacimientoValida,
  }) {
    return copiar(
      emailValido: emailValido,
      passwordValido: passwordValido,
      nombresValidos: nombresValidos,
      apellidosValidos: apellidosValidos,
      telefonoValido: telefonoValido,
      fechaNacimientoValida: fechaNacimientoValida,
      estaConsultando: false,
      estaExitoso: false,
      estaFallido: false,
    );
  }

  RegistroState copiar({
    String emailValido,
    String passwordValido,
    String nombresValidos,
    String apellidosValidos,
    String telefonoValido,
    String fechaNacimientoValida,
    bool estaConsultando,
    bool estaExitoso,
    bool estaFallido,
  }) {
    return RegistroState(
      nombresValidos: nombresValidos ?? this.nombresValidos,
      apellidosValidos: apellidosValidos ?? this.apellidosValidos,
      telefonoValido: telefonoValido ?? this.telefonoValido,
      fechaNacimientoValida: fechaNacimientoValida ?? this.fechaNacimientoValida,
      emailValido: emailValido ?? this.emailValido,
      passwordValido: passwordValido ?? this.passwordValido,
      estaConsultando: estaConsultando ?? this.estaConsultando,
      estaExitoso: estaExitoso ?? this.estaExitoso,
      estaFallido: estaFallido ?? this.estaFallido,
    );
  }

  @override
  String toString() {
    return '''RegistroState {
      emailValido: $emailValido,
      passwordValido: $passwordValido,
      nombresValidos: $nombresValidos,
      apellidosValidos: $apellidosValidos,
      fechaNacimientoValida: $fechaNacimientoValida,
      telefonoValido: $telefonoValido,
      estaConsultando: $estaConsultando,
      estaExitoso: $estaExitoso,
      estaFallido: $estaFallido,
    }''';
  }
}

