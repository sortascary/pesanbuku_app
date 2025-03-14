import 'package:dio/dio.dart';
import 'package:pesanbuku_app/api/api_endpoint.dart';
import 'package:pesanbuku_app/api/dio_instance.dart';

class AuthService {
   final DioInstance _dioInstance = DioInstance();

   Future<Response> login(String phone, String password, String fcmToken) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndpoint.login,
          data: {
            'phone': phone,
            'password': password,
            'fcm_token': fcmToken
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}