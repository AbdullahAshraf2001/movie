import 'package:flutter/material.dart';
import 'package:movie/app_constants/constant_string.dart';
import 'package:movie/data/model/movies.dart';

class SingleMovieCard extends StatelessWidget {
  final Results movieDetails;

  const SingleMovieCard({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: movieDetails.posterPath!.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .3,
                    placeholder: "assets/images/loading.gif",
                    placeholderFit: BoxFit.scaleDown,
                    image: "$imageUrl${movieDetails.posterPath}",
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    "assets/images/error.png",
                    width: MediaQuery.of(context).size.width * .5,
                    height: MediaQuery.of(context).size.height * .236,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${movieDetails.title}",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: MediaQuery.of(context).size.width * .04,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${movieDetails.releaseDate}",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width * .035,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: MediaQuery.of(context).size.width *0.1),
                    Text(
                      "${movieDetails.voteAverage}",
                      style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.width *0.045),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
