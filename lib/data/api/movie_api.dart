import 'package:dio/dio.dart';
import 'package:movie/app_constants/constant_string.dart';

class MoviesApi {
  late Dio dio;

  MoviesApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<Map<String, dynamic>> getAllMovies() async {
    Response response = await dio.get(
      "/movie/popular",
      queryParameters: {"api_key": apiKey},
    );
    return response.data;
  }
}
