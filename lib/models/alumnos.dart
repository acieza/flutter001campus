class Alumnos {
  final String id;
  final String nombre;
  final String email;
  final String role;
  final String img;

  Alumnos({
    this.id,
    this.nombre,
    this.email,
    this.role,
    this.img,
  });

  factory Alumnos.fromJson(Map<String, dynamic> json) {
    return Alumnos(
      id: json['_id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      img: json['img'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{ id: $id, nombre: $nombre}';
  }
}
