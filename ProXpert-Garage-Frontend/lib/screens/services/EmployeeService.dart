import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/employees.dart';

class EmpleatService {
  static const String _baseUrl = "http://localhost:8080/api-rest/users";

  static Future<Empleado?> ferLogin(String usernameOrEmail, String password) async {
    try {
      final url = '$_baseUrl/login';
      final resposta = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "usernameOrEmail": usernameOrEmail,
          "password": password,
        }),
      );

      if (resposta.statusCode == 200) {
        final body = utf8.decode(resposta.bodyBytes);
        final json = jsonDecode(body);
        return Empleado.fromJson(json);
      } else {
        print("Error de login: ${resposta.statusCode}");
      }
    } catch (e) {
      print("Excepció durant el login: $e");
    }
    return null;
  }
}
