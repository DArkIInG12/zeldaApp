import 'package:flutter/material.dart';
import 'package:project1/database/agendadb.dart';
import 'package:project1/models/popular_model.dart';
import 'package:project1/network/api_popular.dart';
import 'package:project1/screens/detail_movie_screen.dart';

Widget movieWidget(PopularModel movie, BuildContext context) {
  Agenda? agendadb = Agenda();
  return GestureDetector(
    onTap: () async {
      var api = ApiPopular();
      var ytId = await api.getMovieTrailer(movie.id!.toString());
      var cast = await api.getCast(movie.id!.toString());
      var lol = await agendadb.GETALLMOVIES();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailMovieScreen(
                    movie: movie,
                    id: ytId,
                    cast: cast,
                  )));
    },
    child: Hero(
      tag: movie.id!,
      child: FadeInImage(
        fit: BoxFit.fill,
        fadeInDuration: const Duration(milliseconds: 500),
        placeholder: const AssetImage('assets/animation/loading2.gif'),
        image:
            NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath}'),
      ),
    ),
  );
}
