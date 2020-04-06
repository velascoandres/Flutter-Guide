List<T> agregarQuitarElementos<T>(T elemento, List<T> lista) {
  List<T> listaClonada = lista.map((element)=>element).toList();
  final bool existeElemento = listaClonada.contains(elemento);
  if (existeElemento) {
    listaClonada.remove(elemento);
  } else {
    listaClonada.add(elemento);
  }
  return listaClonada;
}
