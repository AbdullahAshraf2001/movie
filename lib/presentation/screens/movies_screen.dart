import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/busniess_logic/movies_cubit.dart';
import 'package:movie/data/model/movies.dart';
import 'package:movie/presentation/widgets/single_movie_card.dart';


class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();

}

class _MoviesScreenState extends State<MoviesScreen> {

  List<Results> allMovies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<MoviesCubit>(context).getAllMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF45005E),
        title: Text(
          "Movies",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: buildBlocWidget(),
    );
  }

  buildBlocWidget() {
    return BlocBuilder<MoviesCubit, MoviesState>(
      builder: (context, state) {
        if (state is MoviesLoaded) {
          allMovies = state.movies;
          return buildLoadedMoviesWidget();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  buildLoadedMoviesWidget() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(children: [buildMoviesList()]),
      ),
    );
  }

  buildMoviesList() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 1.4,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: allMovies.length,
      itemBuilder: (context,index){
        return SingleMovieCard(movieDetails: allMovies[index],);
      },
    );
  }
}
