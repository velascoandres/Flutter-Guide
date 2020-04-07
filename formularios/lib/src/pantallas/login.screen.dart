import 'package:flutter/material.dart';
import 'package:formularios/src/mixins/save.mixin.dart';
import 'package:formularios/src/mixins/validation.mixins.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixins, SavedMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Form(
        key: formKey, // Estamos obteniendo una referencia al form state
        child: Column(
          children: <Widget>[
            generarCampoCorreo(),
            generarCampoPassword(),
            Container(
              margin: EdgeInsets.only(top: 25),
            ),
            generarSubmit(this.validarFormulario),
          ],
        ),
      ),
    );
  }

  void validarFormulario() {
    bool formularioValido = formKey.currentState.validate();
    if (formularioValido) {
      formKey.currentState.save();
	  print('${this.login.correo}-${this.login.password}');
    }
  }

  Widget generarCampoCorreo({String valor}) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'you@example.com',
      ),
      autovalidate: false,
      onSaved: this.guardarCorreo,
      validator: validarCorreo,
    );
  }

  Widget generarCampoPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Contraseña',
      ),
      obscureText: true,
      validator: validarPassword,
      onSaved: this.guardarPassword,
    );
  }

  Widget generarSubmit(
    void Function() funcionValidacion,
  ) {
    return RaisedButton(
      child: Text('Submit'),
      onPressed: funcionValidacion,
    );
  }
}
