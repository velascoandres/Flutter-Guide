import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class PalabrasFavoritas extends StatefulWidget {
  static final String nombreRuta = '/palabras-favoritas';
  @override
  _PalabrasFavoritasState createState() => _PalabrasFavoritasState();
}

class _PalabrasFavoritasState extends State<PalabrasFavoritas> {
  List<ListTile> construirFilas(List<WordPair> palabras) {
    if (palabras.length == 0) {
      return [
        ListTile(
          leading: Text('No hay registros'),
        )
      ];
    }
    return palabras
        .map<ListTile>(
          (WordPair palabra) => ListTile(
            leading: Text(palabra.asPascalCase),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final List<WordPair> palabras = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(title: Text('Palabras favoritas')),
      body: ListView(
        children: <Widget>[
          ...construirFilas(palabras),
        ],
      ),
    );
  }
}
