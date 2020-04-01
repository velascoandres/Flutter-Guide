import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  String flutterText = '';
  int indice = 0;
  List<String> colecciones = ['Flutter', 'es', 'genial'];

  void onPressButton(){
    setState(() { // Vuelve a renderizar el widget
      flutterText = colecciones[indice];
      indice++;
      if (indice > colecciones.length -1){
        indice = 0;
      }  
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Para el centro de la pantalla
            children: <Widget>[
              Text(
                this.flutterText,
                style: TextStyle(
                  fontSize: 40.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              RaisedButton(
                color: Colors.blueAccent,
                child: Text(
                  'Actualizar',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: this.onPressButton,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
