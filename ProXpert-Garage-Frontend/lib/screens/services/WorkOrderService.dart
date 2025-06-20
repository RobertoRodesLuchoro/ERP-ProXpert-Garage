import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:proxpert_garage_frontend/models/budget.dart';

import '../../models/workOrder.dart';

class OrdenTrabajoService {
  static const String baseUrl = 'http://localhost:8080/api-rest/ordenes';

  static Future<List<WorkOrderInfo>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => WorkOrderInfo.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener las órdenes de trabajo');
    }
  }

  static Future<WorkOrderInfo?> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return WorkOrderInfo.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<WorkOrderInfo?> getByPresupuestoId(int presupuestoId) async {
    final response = await http.get(Uri.parse('$baseUrl/presupuesto/$presupuestoId'));
    if (response.statusCode == 200) {
      return WorkOrderInfo.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<WorkOrderInfo?> create(Map<String, dynamic> jsonBody) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(jsonBody),
    );

    debugPrint("📥 StatusCode: ${response.statusCode}");
    debugPrint("📥 Body: ${response.body}");

    if (response.statusCode == 201) {
      return WorkOrderInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al crear la orden de trabajo');
    }
  }

  static Future<WorkOrderInfo?> update(Map<String, dynamic> jsonBody) async {
    final response = await http.put(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(jsonBody),
    );

    debugPrint("📥 StatusCode: ${response.statusCode}");
    debugPrint("📥 Body: ${response.body}");
    if (response.statusCode == 200) {
      return WorkOrderInfo.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error al actualizar la orden de trabajo');
    }
  }

  static Future<bool> delete(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/$id'));
    return response.statusCode == 204;
  }

  static Future<List<WorkOrderInfo>> getMostRecent(int quantity) async {
    final response = await http.get(Uri.parse('$baseUrl/recientes?quantity=$quantity'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);

      // 🔍 DEBUG: Imprimir JSON completo
      debugPrint("📥 Datos recibidos en getMostRecent($quantity):", wrapWidth: 1024);
      for (var e in data) {
        debugPrint(jsonEncode(e), wrapWidth: 1024);
      }

      return data.map((e) => WorkOrderInfo.fromJson(e)).toList();
    } else {
      debugPrint("❌ Error ${response.statusCode}: ${response.body}");
      throw Exception('Error al obtener las órdenes de trabajo recientes');
    }
  }
}
