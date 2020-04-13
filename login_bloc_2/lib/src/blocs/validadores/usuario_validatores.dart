class UsuarioValidadores {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  static final RegExp _telefonoRegExp = RegExp(
    r'^[0-9]{10,10}$',
  );

  static final RegExp _soloLetras = RegExp(
    r'^[A-Za-z]{4,}$',
  );

  bool validarEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  String validarEmailStr(String email){
    bool coindicide = _emailRegExp.hasMatch(email);
    if (!coindicide){
      return 'Ingrese un email valido';
    }
    return '';
  }

  String validarPasswordStr(String password){
    bool coindicide = _passwordRegExp.hasMatch(password);
    if (!coindicide){
      return 'Ingrese una clave valida';
    }
    return '';
  }

  bool validarPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }

  String validarTelefono(String telefono){
    bool errorLongitud = !this._validarLongitud(telefono, 10); 
    if (errorLongitud){
      return 'Longitud invalida';
    }
    bool coindicide = _telefonoRegExp.hasMatch(telefono);
    if (!coindicide){
      return 'Ingrese un telefono valido';
    }
    return '';
  }

  bool _validarLongitud(String elemento, int longitud){
    return elemento.length >= longitud;
  }

  String validarSoloLetras(String elemento){
    bool coincide = _soloLetras.hasMatch(elemento);
    if (!coincide){
      return 'Ingrese solo letras';
    }
    return '';
  }
}
