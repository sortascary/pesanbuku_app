import 'package:dio/dio.dart';
import 'package:pesanbuku_app/api/api_endpoint.dart';

class DioInstance {
  late Dio _dio;

   DioInstance()  {
    _dio = Dio(
        BaseOptions(
          baseUrl: ApiEndpoint.baseURL,
        )
    );


    initializeInterceptors();
  }

   Future<Response> getRequest({required String Endpoint, bool? isAuthorized, Map<String, dynamic>? queryParameters}) async{
    Response response;

    try {
      response = await _dio.get(Endpoint, queryParameters: queryParameters,
        options: Options(
            headers: {
              "Accept": "application/json",
              if(isAuthorized ?? false) "Authorization": "Bearer token"
            }),
      );
    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
   }

   Future<Response> postRequest({required String endpoint, bool? isAuthorize, required Object data}) async {
    Response response;
    try {
      response = await _dio.post(
          endpoint,
          data: data,
          options: Options(
              headers: {
                "Accept": "application/json",
                if(isAuthorize ?? false) "Authorization": "Bearer token"
              })
      );


    } on DioException catch (e) {
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(
        InterceptorsWrapper(
            onError: (error, handler) {
              return handler.next(error);
            },

            onRequest: (request, handler) {
              print(request.method + " " + request.path);
              print(request.data);
              return handler.next(request);
            },

            onResponse: (response, handler) {
              print(response.data);
              return handler.next(response);
            }
        )
    );
  }
}