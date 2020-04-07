import 'package:formularios/src/models/login.model.dart';

class SavedMixin {
  final LoginModel login = new LoginModel();
  void guardarCorreo(String correo) {
    this.login.correo = correo;
  }
  void guardarPassword(String password){
    this.login.password = password;
  }
}
