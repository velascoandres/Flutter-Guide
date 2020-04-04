# Tabs

Una tab es un componente que al ser seleccionado muestra un determinado contenido en pantalla (`Fragmentos`).
Trabajar con tabs es un patron comun en las aplicaciones que siguen las directrices del `Material Desing`. 
Flutter incluye una forma convenientte para crear `tab layouts` la cual forma parte de la libreria de `Material`.

## Implemetar Tabs

Para implementar `tabs`en una aplicacion se deben seguir los siguientes pasos:

* Crear `TabController`
* Crear las `Tabs` (Uso del widget)
* Crear el contenido para cada tab.

## Crear un `TabController`

Para que las tabs funcionen, se necesita mantener la tab que se ha seleccionado y su seccion de contenido en sincronia. Esta es la 
funcion del tab controller, es decir saber que se tiene que mostrar en pantalla cuando seleccionas una determinada tab.

Un `TabController` es una clase que se puede crear manualmente o de manera automatica haciendo uso de la clase `DefaultTabController`. 

El `DefaultTabController` es la opcion mas simple para crear un `TabController` y hacerlo disponible para sus widgets descendientes. Es decir
se debe envolver a la aplicacion dentro de este widget.

### Atributos del Widget `DefaultTabController`:

* `length`: El numero de tabs o el numero secciones de contenido que se van a mostrar en pantalla 
* `child`: Aqui va todo el widget de la aplicacion.

```dart
DefaultTabController(
  length: 3,
  child: // Codigo de la app...
  ),
);
```

## Crear las tabs:
Cuando una tab es seleccionada necesita mostrar un contenido. Para crear las tabs se hace uso del widget `TabBar`, que es un widget que muestra en pantalla una fila horizontal de tabs. 

```dart
DefaultTabController(
  length: 3,
  child: Scaffold(
    appBar: AppBar(
      bottom: TabBar(
        tabs: [
          Tab(icon: Icon(Icons.directions_car)),
          Tab(icon: Icon(Icons.directions_transit)),
          Tab(icon: Icon(Icons.directions_bike)),
        ],
      ),
    ),
  ),
);
```

## Crear el contenido para cada tabla:
Para crear el conteido para una tab se hace uso del widget: `TabBarView`:

```dart
TabBarView(
  children: [
    Icon(Icons.directions_car),
    Icon(Icons.directions_transit),
    Icon(Icons.directions_bike),
  ],
);
```

Este widget va dentro del cuerpo de nuestra aplicacion:

```dart
class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: Text('Tabs Demo'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.directions_car),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}
```


