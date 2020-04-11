import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc_2/src/blocs/auth_bloc/auth_bloc.dart';

class InicioPantalla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            child: Text('Salir'),
            onPressed: (){
              BlocProvider.of<AuthBloc>(context).add(DesLogeado());
            },
          ),
        ),
      ),
    );
  }
}
