import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie/data/model/movies.dart';
import 'package:movie/data/repo/movies_repo.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  
  final MoviesRepo moviesRepo;
  List<Movies> movies;
  
  MoviesCubit(this.moviesRepo, this.movies) : super(MoviesInitial());
  
  List<Movies> getAllMovies(){
    moviesRepo.getAllMovies().then((movies){
      emit(MoviesLoaded(movies));
      this.movies = movies;
    });

    return movies;
  }
}
