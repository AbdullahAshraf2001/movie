import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/data/model/movies.dart';
import 'package:movie/data/repo/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {

  final MoviesRepo moviesRepo;
  List<Results> movies = [];

  MoviesCubit(this.moviesRepo) : super(MoviesInitial());

  getAllMovies(){
    moviesRepo.getAllMovies().then((moviesResponse){
      movies = moviesResponse.results ?? [];
      emit(MoviesLoaded(movies));
    });

    return movies;
  }
}
