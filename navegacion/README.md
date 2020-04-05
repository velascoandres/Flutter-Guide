# Navegacion
Las aplicaciones moviles tipicamente revelan su contenido a traves de elementos llamados pantallas o paginas.
En Flutter esos elementos son llamados rutas y son administrados por el `Navigator` widget. Esta clase gestiona una 
pila de objetos de ruta y proporciona los metodos para administrar la pila (`stack`). 

Cuando la interfaz de usuario de tu aplicacion encaja con el paradigma, en donde el usuario deberia poder navegar hacia atras a un temprano elemento en la pila. Es apropiado el uso correcto de las rutas y la navegacion. En plataformas como Android, el sistema de la interfaz de usuario proporcionara un boton de regreso (fuera de los limietes de tu aplicacion) que permitira al usuario navegar hacia atras en el stack de rutas. 




## Navigator class

Es un widget que manega un conjunto de widgets con la el paradigma del `stack`

## Rutas
Version abstracta de lo que vendria a ser una `pantalla`

## Paradigma del `stack`

Es una estructura de datos aplilada que tiene dos acciones:

* `push`: Amontonar un elemento al final del `stack`.
* `pop`: Quitar el ultimo elemento del `stack`.

Es decir en nuestra apliacion todas las rutas de nuestra aplicacion se van a guardar 
en un `stack` en donde el orden de estas rutas en la estructura de datos depende de la logica
que le demos a nuestra aplicacion. 


```dart
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  void irSegundaPantalla() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SegundaPantalla(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primera pantalla'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Ir a Segunda pantalla'),
          onPressed: this.irSegundaPantalla,
        ),
      ),
    );
  }
}
```