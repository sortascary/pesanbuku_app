import 'package:dio/dio.dart';
import 'package:pesanbuku_app/api/api_endpoint.dart';
import 'package:pesanbuku_app/api/dio_instance.dart';

class AuthService {
   final DioInstance _dioInstance = DioInstance();

   Future<Response> register(String name, String phone, String daerah, String? schoolName, String role, String password, String fcmToken) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndpoint.login,
          data: {
            'name': name,
            'phone': phone,
            'daerah': daerah,
            'school_name': schoolName,
            'role': role,
            'password': password,
            'FCMToken': fcmToken,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

   Future<Response> login(String phone, String password, String fcmToken) async {
    try {
      final response = await _dioInstance.postRequest(
          endpoint: ApiEndpoint.login,
          data: {
            'phone': phone,
            'FCMToken': fcmToken,
            'password': password,
          }
      );

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

}