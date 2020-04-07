class ValidationMixins {
  String validarCorreo(String correo) {
    if (!correo.contains('@')) {
      return 'Email invalido';
    }
    return null;
  }

  String validarPassword(String password) {
    if (password.length < 6) {
      return 'Contraseña corta';
    }
    return null;
  }
}
