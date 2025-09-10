import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/busniess_logic/movies_cubit.dart';
import 'package:movie/data/api/movie_api.dart';
import 'package:movie/data/repo/movies_repo.dart';
import 'package:movie/presentation/screens/movies_screen.dart';

class AppRouter {
  late MoviesRepo moviesRepo;
  late MoviesCubit moviesCubit;

  AppRouter() {
    moviesRepo = MoviesRepo(MoviesApi());
    moviesCubit = MoviesCubit(moviesRepo, []);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => moviesCubit,
            child: MoviesScreen(),
          ),
        );
    }
  }
}
