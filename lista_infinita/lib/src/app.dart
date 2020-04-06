import 'package:flutter/material.dart';
import 'dart:math';
import 'package:english_words/english_words.dart';
import 'package:lista_infinita/src/funciones/agregar_quitar_elementos.funcion.dart';
import 'package:lista_infinita/src/pantallas/palabras_favoritas.lista.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final suggestion = <WordPair>[];
  List<WordPair> elementosFavoritos = <WordPair>[];

  ListTile construirFila(WordPair wordPair) {
    return ListTile(
      trailing: Icon(
        this.elementosFavoritos.contains(wordPair)
            ? Icons.favorite
            : Icons.favorite_border,
        color: Colors.redAccent,
      ),
      title: Text(wordPair.asPascalCase),
      onTap: () {
        setState(() {
          this.elementosFavoritos = agregarQuitarElementos<WordPair>(
              wordPair, this.elementosFavoritos);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    void irPalabrasFavoritas() {
      Navigator.pushNamed(context, PalabrasFavoritas.nombreRuta,
          arguments: elementosFavoritos);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista infinita'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: irPalabrasFavoritas,
          )
        ],
      ),
      body: ListView.builder(
        itemBuilder: (context, indice) {
          if (indice.isOdd) return Divider();
          if (indice >= suggestion.length) {
            suggestion.addAll(generateWordPairs()
                .take(10)
                .toList()); // agregar mas palabras a la lista
          }
          return construirFila(suggestion[indice]);
        },
      ),
    );
  }
}
