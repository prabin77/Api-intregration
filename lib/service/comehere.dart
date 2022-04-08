import 'package:dio/dio.dart';

class ComeHere {
  Dio dio = Dio();
  static const String _baseUrl = "https://jsonplaceholder.typicode.com";

  Future<Response> getDetails(String endpoint) async {
    Response response = await dio.get('$_baseUrl/$endpoint');
    return response;
  }
}
