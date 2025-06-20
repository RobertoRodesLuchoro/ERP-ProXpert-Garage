class Empleado {
  final int empleadoId;
  final String rol;
  final String username;
  final String email;
  final String hashedPassword;
  final String? nombre;
  final String? apellidos;
  final String? puesto;
  final double? precioHora;
  final String? telefonoMovil;
  final String? localidad;

  Empleado({
    required this.empleadoId,
    required this.rol,
    required this.username,
    required this.email,
    required this.hashedPassword,
    this.nombre,
    this.apellidos,
    this.puesto,
    this.precioHora,
    this.telefonoMovil,
    this.localidad,
  });

  factory Empleado.fromJson(Map<String, dynamic> json) {
    return Empleado(
      empleadoId: json['id'],
      rol: json['rol'],
      username: json['username'],
      email: json['email'],
      hashedPassword: json['hashedPassword'],
      nombre: json['nombre'],
      apellidos: json['apellidos'],
      puesto: json['puesto'],
      precioHora: json['precioHora']?.toDouble(),
      telefonoMovil: json['telefonoMovil'],
      localidad: json['localidad'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'empleadoId': empleadoId,
      'rol': rol,
      'username': username,
      'email': email,
      'hashedPassword': hashedPassword,
      'nombre': nombre,
      'apellidos': apellidos,
      'puesto': puesto,
      'precioHora': precioHora,
      'telefonoMovil': telefonoMovil,
      'localidad': localidad,
    };
  }
}
