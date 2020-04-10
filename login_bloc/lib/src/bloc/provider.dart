import 'package:flutter/material.dart';
import 'package:login_bloc/src/bloc/bloc.dart';
// proveernos

class Provider extends InheritedWidget {


  Provider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = Bloc();
  @override
  bool updateShouldNotify(_) => true;

  static Bloc of(BuildContext context) =>
      (context.dependOnInheritedWidgetOfExactType<Provider>(aspect: Provider))
          .bloc;
}
