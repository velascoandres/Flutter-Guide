# Stateless y Stateful Widgets

Los widgets en si son clases en dart, entonces los widgets
se extienden de StatelessWidget el cual es el widget base para 
crear widgets.

## Stateless Widget
Los Stateless Widgets son la alternatica para crear widgets
que no tengan que interactuar con datos. Es decir tienen un
estado constante. 

* No manejan estado son inmutables.


### Build
Este metodo es el que construye el widget que recibe como
paramatro un BuildContext sirve:
 
* Para identificar el widget en el arbol de widgets
* Para saber donde se ubica el widget.
* Permite acceder al contexto del padre


Ejemplo

```dart
class Tarjeta extends StatelessWidget {
  final String titulo;
  final IconData icono;

  Tarjeta({@required this.titulo, @required this.icono});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                this.titulo,
                style: TextStyle(fontSize: 32, color: Colors.grey),
              ),
              Icon(
                this.icono,
                color: Colors.redAccent,
                size: 40,
              )
            ],
          )
        ),
    );
  }
}
```

Tranquilamente este widget lo podemos reusar en la aplicacion:

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateless widget'),
      ),
      body: Container(
        child: Column(
          // Widgets en distintas filas
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // Los w. ocupararan toda la fila
          children: <Widget>[
            Tarjeta(
              titulo: 'Andres',
              icono: Icons.account_balance,
            ),
            Tarjeta(
              titulo: 'Juan',
              icono: Icons.accessible_forward,
            ),
            Tarjeta(titulo: 'Pecados', icono: Icons.access_alarms),
          ],
        ),
      ),
    );
  }
}
```


## Stateful
Son widgets que interactuan con los datos y por lo tal su estado 
va a cambiar constantemente.





