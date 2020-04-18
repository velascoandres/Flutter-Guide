import 'package:meta/meta.dart';

class Usuario{
  int id;
  String nombres;
  String apellidos;
  String correo;
  String telefono;
  String fechaNacimiento;
  String password;

  Usuario({
    @required this.correo,
    @required this.nombres,
    @required this.apellidos,
    @required this.telefono,
    @required this.fechaNacimiento,
    this.password,
    this.id,
  });
}
