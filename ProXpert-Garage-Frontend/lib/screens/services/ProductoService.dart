import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../models/product.dart'; // Asegúrate de tener la clase Producto aquí

class ProductoService {
  static const String baseUrl = 'http://localhost:8080/api/productos';

  static Future<List<Producto>> getAll() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Producto.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener los productos');
    }
  }

  static Future<Producto?> getById(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    if (response.statusCode == 200) {
      return Producto.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<List<Producto>> getMostRecent(int cantidad) async {
    final response = await http.get(Uri.parse('$baseUrl/recientes?cantidad=$cantidad'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Producto.fromJson(e)).toList();
    } else {
      throw Exception('Error al obtener productos recientes');
    }
  }
}
