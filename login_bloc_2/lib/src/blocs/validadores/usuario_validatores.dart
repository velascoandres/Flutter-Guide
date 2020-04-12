class UsuarioValidadores {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  bool validarEmail(String email) {
    print('validacion ${email.contains('@')}');
    return email.contains('@');
  }

  bool validarPassword(String password) {
    return password.length > 3;
  }
}
