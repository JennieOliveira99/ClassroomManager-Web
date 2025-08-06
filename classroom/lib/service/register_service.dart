import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:classroom/model/register.dart';

class RegisterService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://localhost/Mapa/Usuario",
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.plain,
    ),
  );

  Future<Map<String, dynamic>> register(Register register) async {
    try {
      print('Enviando dados para cadastro: ${register.toJson()}');

      final response = await _dio.post(
        '/inserir',
        data: register.toJson(),
        options: Options(validateStatus: (status) => status! < 500),
      );

      print('Resposta bruta recebida: ${response.data}');

      dynamic responseData;
      try {
        responseData = response.data is String
            ? jsonDecode(response.data)
            : response.data;
      } catch (e) {
        print('Erro ao parsear resposta: $e');
        return {
          "success": false,
          "message": "Erro ao processar resposta do servidor",
        };
      }

      print('Resposta parseada: $responseData');

      final success = (responseData['codigo'] == 1);
      final message =
          responseData['msg']?.toString() ??
          (success ? "Cadastro realizado com sucesso" : "Erro no cadastro");

      return {"success": success, "data": responseData, "message": message};
    } on DioException catch (e) {
      print('Erro DioException: ${e.toString()}');

      String errorMessage = "Não foi possível conectar ao servidor";

      if (e.response != null) {
        try {
          final errorData = e.response!.data is String
              ? jsonDecode(e.response!.data)
              : e.response!.data;

          errorMessage =
              errorData['msg']?.toString() ?? "Erro ${e.response?.statusCode}";
        } catch (e) {
          errorMessage = "Erro ao processar resposta do servidor";
        }
      }

      return {"success": false, "message": errorMessage};
    } catch (e) {
      print('Erro inesperado: $e');
      return {"success": false, "message": "Erro inesperado: ${e.toString()}"};
    }
  }
}
