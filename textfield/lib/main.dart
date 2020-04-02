import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyAplicacion(),
  ));
}

enum DialogAction{
  yes,
  no,
}

class MyAplicacion extends StatefulWidget {
  @override
  _MyAplicacionState createState() => _MyAplicacionState();
}

class _MyAplicacionState extends State<MyAplicacion> {
  final TextEditingController controladorTexto = new TextEditingController();
  String valor = '';

  void alertResult(DialogAction action){
    print('tu seleccion es $action');
  }
  accionarTextField(String valor) {
    setState(() {
      this.valor = valor;
      controladorTexto.text = '';
    });
  }

  mostrarAlerta(){
    AlertDialog dialogo = new AlertDialog(
      content: Text(this.controladorTexto.text),
      actions: <Widget>[
        FlatButton(
          onPressed: (){alertResult(DialogAction.yes);},
          child: Text('SI'),
        ),
        FlatButton(
          onPressed: (){alertResult(DialogAction.no);},
          child: Text('No'),
        ),
      ],
    );
    showDialog(
      context: context, 
    builder: (BuildContext context) {return dialogo;}
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo de textfield'),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'Ingrese el texto aqui'),
                // onSubmitted: this.accionarTextField,
                controller: controladorTexto,
              ),
              Padding(
                padding: EdgeInsets.all(10.5),
              ),
              // Text(this.valor)
              RaisedButton(
                child: Text('Ver Alerta'),
                onPressed: mostrarAlerta,
              ),
            ],
          ),
        ));
  }
}
