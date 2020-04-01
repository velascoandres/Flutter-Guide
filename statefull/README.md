# Stateful Widget

Es un widget en donde su estado es mutable, en otras palabras
a diferencia de de los `Stateless Widgets` que son estaticos en cuando
a datos y estado, los `Stateful Widgets` son dinamicos.

## Implementacion

Para implementar un widgtet `Stateful` se debe definir las siguientes clases:

* La clase principal del widget que hereadara de `StatefulWidget` 

>Se debe implementar el metodo `createState` que debe ser del tipo  `State`

```dart
class Contador extends StatefulWidget {
  @override
  _ContadorState createState() => _ContadorState();
}
```


* La clase adjunta de estado (`State`), en donde estara toda la logica y construcruccion del widget.

>Para poder actualizar el estado del widget, tenemos que hacer uso de la funcion `setState`

>La funcion `setState` recibe un `callback` en cuyo interior van todos los datos que se van actualizar. 

```dart
    class _ContadorState extends State<Contador> {
    int numero = 1;

    void onPressButton(){
        setState(() { // Vuelve a renderizar el widget
            numero++;
        });
    }    

    @override
    Widget build(BuildContext context) {
        return   child: Center(
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
                  'El contador: $numero',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: this.onPressButton,
              ),
            ],
          ),,
        );
    }
}
```

## Uso del widget en la aplicacion:

Los `Stateful widgets` se usan como cualquier otro widget dentro de la apliacion que estemos desarrollando: 

```dart
class MiAplicacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ejemplo'),
        ),
        body: Center(
          child: Contador(),
        ));
  }
}
```

## Obtener datos del widget desde la clase State
Digamos que tenemos un widget que recibe datos desde el constructor y queremos usar esa informacion en la clase `State`.

```dart
class CabeceraTexto extends StatefulWidget {
  final String titulo;

  CabeceraTexto({this.titulo});  
  
  @override
  _CabeceraTextoState createState() => _CabeceraTextoState();
}
```

Ahora para acceder al atributo `titulo` usamos el atributo `widget` que esta en nuestra clase de `State`. Este atributo se hereda y contiene la referencia al widget en cuestion.

```dart
    class CabeceraTextoState extends State<CabeceraTexto>  {
      @override
      Widget build(BuildContext context) {

        const titulo = widget.titulo;    

        return Center(
        child: Text("$titulo")
       );
  }
}
``` 

> Dato de vital importancia:

La funcion `setState` solamente se puede usar en widget con estado (`Stateful`)