class Producto {
  final int? id;
  final int? proveedorId;
  final String nombre;
  final String descripcion;
  final String categoria;
  final double precio;
  final int cantidad;

  Producto({
    this.id,
    this.proveedorId,
    required this.nombre,
    required this.descripcion,
    required this.categoria,
    required this.precio,
    required this.cantidad,
  });

  factory Producto.fromJson(Map<String, dynamic> json) {
    return Producto(
      id: json['id'],
      proveedorId: json['proveedorId'],
      nombre: json['nombre'] ?? '',
      descripcion: json['descripcion'] ?? '',
      categoria: json['categoria'] ?? '',
      precio: (json['precio'] as num).toDouble(),
      cantidad: json['cantidad'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'proveedorId': proveedorId,
      'nombre': nombre,
      'descripcion': descripcion,
      'categoria': categoria,
      'precio': precio,
      'cantidad': cantidad,
    };
  }
}
final List<Producto> demoProductos = [
  Producto(
    id: 1,
    proveedorId: 201,
    nombre: "Aceite 10W-40",
    descripcion: "Lubricante sintético para motor de alto rendimiento",
    categoria: "Lubricantes",
    precio: 25.50,
    cantidad: 50,
  ),
  Producto(
    id: 2,
    proveedorId: 202,
    nombre: "Filtro de aire",
    descripcion: "Filtro de aire compatible con vehículos diésel y gasolina",
    categoria: "Filtros",
    precio: 12.99,
    cantidad: 30,
  ),
  Producto(
    id: 3,
    proveedorId: 203,
    nombre: "Pastillas de freno",
    descripcion: "Juego de pastillas de freno delanteras",
    categoria: "Frenos",
    precio: 35.00,
    cantidad: 10,
  ),
  Producto(
    id: 4,
    proveedorId: 204,
    nombre: "Batería 70Ah",
    descripcion: "Batería de coche 12V 70Ah con tecnología AGM",
    categoria: "Baterías",
    precio: 95.75,
    cantidad: 10,
  ),
];
