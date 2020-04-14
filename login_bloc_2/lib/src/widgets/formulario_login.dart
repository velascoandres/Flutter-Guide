import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';
import 'package:login_bloc_2/src/blocs/login_bloc/login_bloc.dart';

class FormularioLogin extends StatefulWidget {
  @override
  _FormularioLoginState createState() => _FormularioLoginState();
}

class _FormularioLoginState extends State<FormularioLogin> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_escucharEmail);
    _passwordController.addListener(_escucharPassword);
  }

  _escucharEmail() {
      _loginBloc.add(CambioEmail(email: this._emailController.text));
    }

    _escucharPassword() {
      _loginBloc.add(CambioPassword(password: this._passwordController.text));
    }

  bool estaHabilitadoBotonLogin(LoginState state) {
    print('boton $state');
    return state.estaFormularioValido &&
        estaLlenoformulario &&
        !state.estaConsultando;
  }

  bool get estaLlenoformulario =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  _presionarBotonLogin() {
      _loginBloc.add(
        BotonLoginPresionado(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (BuildContext context, LoginState state) {
        if (state.estaFallido) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('Formulario invalido'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.estaConsultando) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Logging In...'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.estaExitoso) {
          BlocProvider.of<AuthBloc>(context).add(Logeado());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(builder: (BuildContext context, LoginState state) {
        return Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'username'),
                controller: _emailController,
                autovalidate: true,
                autocorrect: false,
                validator: (_) {
                  print('estado $state - ${state.estaFormularioValido}');
                  return state.emailValido ? null : 'Email incorrecta';
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'password'),
                controller: _passwordController,
                obscureText: true,
                autovalidate: true,
                autocorrect: false,
                validator: (_) {
                  print('estado $state');
                  return state.passwordValido ? null : 'Password incorrecta';
                },
              ),
              RaisedButton(
                onPressed: estaHabilitadoBotonLogin(state) ? _presionarBotonLogin : null,
                child: Text('Login'),
              ),
              Container(
                child:
                    state.estaConsultando ? CircularProgressIndicator() : null,
              ),
            ],
          ),
        );
      }),
    );
  }
}
