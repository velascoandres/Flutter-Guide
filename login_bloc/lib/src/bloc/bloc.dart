import 'dart:async';
import 'package:login_bloc/src/bloc/validator.dart';

class Bloc with Validators {
  final _emailController = StreamController<String>();

  final _passwordController = StreamController<String>();

  Stream<String> get correo =>
      _emailController.stream.transform(this.validarEmail);

  Stream<String> get password =>
      _passwordController.stream.transform(this.validarPassword);

  Function(String correo) get cambiarEmail => _emailController.sink.add;
  Function(String password) get cambiarPassword => _passwordController.sink.add;

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}