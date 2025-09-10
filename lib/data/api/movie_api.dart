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

  Future<List<dynamic>?> getAllMovies() async {
    try {
      Response response = await dio.get(baseUrl);
      return response.data;
    } catch (e) {
      return [];
    }
  }
}


