class ApiEndpoint {
  static String baseURL = 'http://192.168.0.118:8000/api';

  static String authURL = '$baseURL/user'; 
  static String login = '$authURL/login';
  static String register = '$authURL/register';
}