part of 'registro_bloc.dart';

abstract class RegistroEvent extends Equatable {
  const RegistroEvent();
}

class CambioNombres extends RegistroEvent {
  final String nombres;

  CambioNombres({@required this.nombres});

  @override
  List<Object> get props => [nombres];
}

class CambioApellidos extends RegistroEvent {
  final String apellidos;

  CambioApellidos({@required this.apellidos});

  @override
  List<Object> get props => [apellidos];
}

class CambioCorreo extends RegistroEvent {
  final String correo;

  CambioCorreo({@required this.correo});

  @override
  List<Object> get props => [correo];
}


class CambioPassword extends RegistroEvent {
  final String password;

  CambioPassword({@required this.password});

  @override
  List<Object> get props => [password];
}

class CambioTelefono extends RegistroEvent {
  final String telefono;

  CambioTelefono({@required this.telefono});

  @override
  List<Object> get props => [telefono];
}

class CambioFechaNacimiento extends RegistroEvent {
  final String fechaNacimiento;

  CambioFechaNacimiento({@required this.fechaNacimiento});

  @override
  List<Object> get props => [fechaNacimiento];
}

class PresionadoBotonRegistrado extends RegistroEvent {
  final Usuario usuario;

  PresionadoBotonRegistrado(
    {
      @required this.usuario,
    }
  );
  @override
  List<Object> get props => [
    usuario.nombres,
    usuario.apellidos,
    usuario.correo,
    usuario.fechaNacimiento,
    usuario.password,
    usuario.telefono,
    ];
}
