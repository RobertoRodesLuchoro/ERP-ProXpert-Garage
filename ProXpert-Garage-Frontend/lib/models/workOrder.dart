import 'dart:ui';

import 'package:proxpert_garage_frontend/models/budget.dart';

class WorkOrderInfo {
  final int? id;
  final String? cliente;
  final String? vehiculo;
  final String? matricula;
  final String? estado;
  final DateTime? fechaInicio;
  final DateTime? fechaFin;
  final double? totalOrdenTrabajo;

  WorkOrderInfo({
    required this.id,
    required this.cliente,
    required this.vehiculo,
    required this.matricula,
    required this.estado,
    required this.fechaInicio,
    required this.fechaFin,
    required this.totalOrdenTrabajo,
  });

  factory WorkOrderInfo.fromJson(Map<String, dynamic> json) {
    return WorkOrderInfo(
      id: json['id'],
      cliente: json['cliente'],
      vehiculo: json['vehiculo'],
      matricula: json['matricula'],
      estado: json['estado'],
      fechaInicio: json['fechaInicio'] != null
          ? DateTime.parse(json['fechaInicio'])
          : null,
      fechaFin: json['fechaFin'] != null
          ? DateTime.parse(json['fechaFin'])
          : null,
      totalOrdenTrabajo: json['precioTotal']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cliente': cliente,
      'vehiculo': vehiculo,
      'matricula': matricula,
      'fechaInicio': fechaInicio?.toIso8601String(),
      'fechaFin': fechaFin?.toIso8601String(),
      'estado': estado,
      'precioTotal': totalOrdenTrabajo,
    };
  }
}
