class Profesores {
  final String id;
  final String nombre;
  final String email;
  final String role;
  final String img;

  Profesores({
    this.id,
    this.nombre,
    this.email,
    this.role,
    this.img,
  });

  factory Profesores.fromJson(Map<String, dynamic> json) {
    return Profesores(
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
