import 'dart:ui';

class BudgetInfo {
  final int? id;
  final String? nombreCliente;
  final String? matriculaVehiculo;
  final String? vehiculoMarcaModeloAnyo;
  final DateTime? fechaPresupuesto;
  final String? estado;
  final String? svgSrc;
  final Color? color;
  final double? totalPresupuesto;

  BudgetInfo({
    required this.id,
    required this.nombreCliente,
    required this.matriculaVehiculo,
    required this.vehiculoMarcaModeloAnyo,
    required this.fechaPresupuesto,
    required this.estado,
    required this.svgSrc,
    this.color,
    required this.totalPresupuesto,
  });

  factory BudgetInfo.fromJson(Map<String, dynamic> json) {
    final cliente = json['cliente'];
    final vehiculo = json['vehiculo'];
    final estado = json['estado']?.toString().toLowerCase() ?? 'desconocido';

    Color estadoColor;
    switch (estado) {
      case 'pendiente':
        estadoColor = const Color(0xFFFFC600);
        break;
      case 'aceptado':
        estadoColor = const Color(0xFF21F32B);
        break;
      case 'rechazado':
        estadoColor = const Color(0xFFFF2222);
        break;
      default:
        estadoColor = const Color(0xFF9E9E9E);
    }

    String? nombreCompleto = cliente != null
        ? '${cliente['nombre'] ?? ''} ${cliente['apellidos'] ?? ''}'.trim()
        : 'Sin nombre';

    String? matricula = vehiculo?['matricula'] ?? 'Desconocida';

    String? marcaModeloAnyo = vehiculo != null
        ? '${vehiculo['marca'] ?? ''} ${vehiculo['modelo'] ?? ''} - ${vehiculo['anyo'] ?? ''}'.trim()
        : 'Vehículo desconocido';

    return BudgetInfo(
      id: json['id'],
      nombreCliente: nombreCompleto,
      matriculaVehiculo: matricula,
      vehiculoMarcaModeloAnyo: marcaModeloAnyo,
      fechaPresupuesto: json['fechaCreacion'] != null
          ? DateTime.parse(json['fechaCreacion'])
          : null,
      estado: json['estado'],
      totalPresupuesto: (json['precioTotal'] as num?)?.toDouble(),
      svgSrc: "assets/icons/Documents.svg",
      color: estadoColor,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fechaCreacion': fechaPresupuesto?.toIso8601String(),
      'estado': estado,
      'precioTotal': totalPresupuesto,
    };
  }
}