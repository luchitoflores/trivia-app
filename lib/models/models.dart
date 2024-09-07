class Opcion {
  final int id;
  final String texto;

  Opcion({required this.id, required this.texto});
}

class Pregunta {
  final int id;
  final String texto;
  final List<Opcion> opciones;
  final int respuestaCorrectaId;

  Pregunta({required this.id, required this.texto, required this.opciones, required this.respuestaCorrectaId});
}

class Nivel {
  final int id;
  final String nombre;
  final List<Pregunta> preguntas;
  int estrellasObtenidas; // Agrega esta propiedad

  Nivel({
    required this.id,
    required this.nombre,
    required this.preguntas,
    this.estrellasObtenidas = 0, // Inicializa en 0 por defecto
  });
}


class Categoria {
  final int id;
  final String nombre;
  final List<Nivel> niveles;

  Categoria({required this.id, required this.nombre, required this.niveles});
}

class Materia {
  final int id;
  final String nombre;
  final List<Categoria> categorias;

  Materia({required this.id, required this.nombre, required this.categorias});
}
