part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}

final class MoviesLoaded extends MoviesState {
  final List<Results> movies;
  MoviesLoaded(this.movies);
}

