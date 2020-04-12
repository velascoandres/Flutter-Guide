import 'package:flutter/widgets.dart';

class AuthRepositorio {
  String _token = '';
  // Metodo para obtener el token
  Future<void> autenticar({
    @required String email,
    @required String password,
  }) async {
    // simular peticion http
    await Future.delayed(Duration(seconds: 1));
    this._token = 'token_generado';
    return;
  }

  // Borrar el token
  Future<void> borrarToken() async {
    await Future.delayed(Duration(seconds: 1));
    this._token = '';
    return;
  }
  // Refrescar el token
  Future<void> guardarToken(
    String token
  ) async {
    await Future.delayed(Duration(seconds: 1));
    this._token = token;
    return;
  }
  // Refrescar el token
  Future<bool> tieneToken(
  ) async {
    await Future.delayed(Duration(seconds: 1));
    return this._token != '' ? true : false;
  }
}
