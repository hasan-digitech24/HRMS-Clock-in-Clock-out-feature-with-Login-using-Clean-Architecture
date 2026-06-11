import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiRoutes {
  ///
  /// Serving url
  ///
  static String get baseUrl => dotenv.get('BASE_URL');
  // static String get imageUrl => dotenv.get('Image_URL');

  //authentication
  static const login = "login";
  static String clockIn(int id) => "set-clocking/$id";
  static String checkStatus(int id) => "check-status/$id";

  // static const signup = "/auth/register";
}
