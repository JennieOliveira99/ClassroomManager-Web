import 'package:classroom/model/login.dart';
import 'package:dio/dio.dart';

class LoginService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost/Mapa/Usuario",
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
    ),
  );

  Future<Map<String, dynamic>> login(Login login) async {
    try {
      final response = await _dio.post('/logar', data: login.toJson());

      if (response.statusCode == 200) {
        return {
          "success": true,
          "data": response.data,
          "message": "Login successful",
        };
      } else {
        return {"success": false, "message": "Error: ${response.statusCode}"};
      }
    } on DioException catch (e) {
      return {
        "success": false,
        "message": e.response?.data ?? "Connection error",
      };
    }
  }
}
