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
                    width: double.infinity,
                    height: 180,
                    placeholder: "assets/images/loading.gif",
                    image: "$imageUrl${movieDetails.posterPath}",
                    fit: BoxFit.fill,
                  )
                : Image.asset("assets/images/error.png"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${movieDetails.title}",
                        style: TextStyle(color: Colors.black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "${movieDetails.releaseDate}",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 34,
                      ),
                      Text(
                        "${movieDetails.voteAverage}",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
