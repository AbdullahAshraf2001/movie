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
  List<Results> searchedForMovies = [];
  bool isSearching = false;
  final searchTextController = TextEditingController();

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
        leading: isSearching ? BackButton(color: Colors.white) : null,
        title: isSearching ? buildSearchField() : buildAppBar(),
        actions: [buildAppBarAction()],
      ),
      body: buildBlocWidget(),
    );
  }

  buildAppBar() {
    return Text(
      "Movies",
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
        childAspectRatio: 1.1,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? allMovies.length
          : searchedForMovies.length,
      itemBuilder: (context, index) {
        return SingleMovieCard(
          movieDetails: searchTextController.text.isEmpty
              ? allMovies[index]
              : searchedForMovies[index],
        );
      },
    );
  }

  buildSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: "Search for a movie...",
        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
        border: InputBorder.none,
      ),
      style: TextStyle(color: Colors.white, fontSize: 18),
    );
  }

  addSearchedMovieToSearchedList(String searchedWord) {
    searchedForMovies = allMovies
        .where((movie) => movie.title!.toLowerCase().contains(searchedWord))
        .toList();
    setState(() {});
  }

  buildAppBarAction() {
    if (isSearching) {
      return InkWell(
        onTap: () {
          addSearchedMovieToSearchedList(searchTextController.text.toLowerCase());
        },
        child: Padding(
          padding: const EdgeInsets.only(right: 12, top: 12, bottom: 12, left: 12),
          child: Text("Search", style: TextStyle(color: Colors.white)),
        ),
      );
    } else {
      return IconButton(
        onPressed: () {
          startSearch();
        },
        icon: Icon(Icons.search, color: Colors.white,),
      );
    }
  }

  startSearch() {
    ModalRoute.of(
      context,
    )!.addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  stopSearching() {
    clearSearch();
    setState(() {
      isSearching = false;
    });
  }

  clearSearch() {
    setState(() {
      searchTextController.clear();
      searchedForMovies.clear();
    });
  }

}
