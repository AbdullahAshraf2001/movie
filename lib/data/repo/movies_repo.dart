import 'package:movie/data/api/movie_api.dart';

import '../model/movies.dart';

class MoviesRepo{
  MoviesApi? moviesApi;
  MoviesRepo(this.moviesApi);
  Future<List<dynamic>?> getAllMovies() async {
    final movies = await moviesApi?.getAllMovies();
    return movies?.map((movie) => Movies.fromJson(movie)).toList();
  }
}