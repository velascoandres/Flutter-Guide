import 'dart:async';

class Validators {
  final validarEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Email invalido');
      }
    },
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (String password, sink) {
      if (password.length > 5) {
        sink.add(password);
      } else {
        sink.addError('Passoword invalido');
      }
    },
  );
}
