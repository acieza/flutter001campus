class Curso {
  final String id;
  final String titulo;
  final String titulo2;
  final String imagen;
  final String descripcion;
  final String descripcionGeneral;
  final int precio;
  final int tiempo;
  final bool oferta;

  Curso(
      {this.id,
      this.titulo,
      this.imagen,
      this.precio,
      this.tiempo,
      this.titulo2,
      this.descripcion,
      this.descripcionGeneral,
      this.oferta});

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['_id'] as String,
      titulo: json['titulo'] as String,
      titulo2: json['titulo2'] as String,
      precio: json['precio'] as int,
      tiempo: json['tiempo'] as int,
      descripcion: json['descripcion'] as String,
      descripcionGeneral: json['descripcionGeneral'] as String,
      imagen: json['imagen'] as String,
      oferta: json['oferta'] as bool,
    );
  }

  @override
  String toString() {
    return 'Trans{ id: $id, titulo: $titulo}';
  }
}
