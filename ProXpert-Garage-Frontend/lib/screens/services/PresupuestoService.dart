import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proxpert_garage_frontend/models/budget.dart';

class PresupuestoService {
  static const String baseUrl = 'http://localhost:8080/api-rest/presupuestos';

  // Obtener todos los presupuestos
  static Future<List<BudgetInfo>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => BudgetInfo.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener los presupuestos');
    }
  }

  // Obtener un presupuesto por su ID
  static Future<BudgetInfo?> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return BudgetInfo.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  // Obtener todos los presupuestos de un vehículo
  static Future<List<BudgetInfo>> getByVehiculoId(int vehiculoId) async {
    final response = await http.get(Uri.parse('$baseUrl/vehiculo/$vehiculoId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => BudgetInfo.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener presupuestos por vehículo');
    }
  }

  // Obtener todos los presupuestos de un cliente
  static Future<List<BudgetInfo>> getByClienteId(int clienteId) async {
    final response = await http.get(Uri.parse('$baseUrl/cliente/$clienteId'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => BudgetInfo.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener presupuestos por cliente');
    }
  }

  // Obtener los presupuestos más recientes (paginar por cantidad)
  static Future<List<BudgetInfo>> getMostRecent(int cantidad) async {
    final response = await http.get(Uri.parse('$baseUrl/recientes?cantidad=$cantidad'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => BudgetInfo.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener presupuestos recientes');
    }
  }

}