import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/models/popular_model.dart';

class ApiPopular {
  Uri link = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=d3959d562347a2bef7256a39a99703a0&language=en-MX&page=1%27)");

  Future<List<PopularModel>?> getAllPopular() async {
    var response = await http.get(link);

    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body)["results"] as List;
      return jsonRes.map((popular) => PopularModel.fromMap(popular)).toList();
    } else {
      return null;
    }
  }

  Future<String?> getMovieTrailer(String movieId) async {
    Uri zelda = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/videos?api_key=d3959d562347a2bef7256a39a99703a0&language=en");
    var response = await http.get(zelda);

    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body)["results"] as List;
      var videoId = "";
      for (var element in jsonRes) {
        if (!element["name"].toString().contains("Teaser")) {
          if (element["name"].toString() == "Official Trailer") {
            videoId = element["key"];
            break;
          } else if (element["name"].toString().contains("Trailer")) {
            videoId = element["key"];
          }
        }
      }
      return videoId;
    } else {
      return null;
    }
  }

  Future<Map<int, dynamic>?> getCast(String movieId) async {
    Uri zelda = Uri.parse(
        "https://api.themoviedb.org/3/movie/$movieId/credits?api_key=d3959d562347a2bef7256a39a99703a0&language=en");
    Map<int, dynamic> castList = {};
    var response = await http.get(zelda);
    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body)["cast"] as List;
      var i = 0;
      for (var element in jsonRes) {
        if (element["known_for_department"] == "Acting") {
          castList[i] = {
            "name": element["name"],
            "movieName": element["character"] ?? "",
            "photo": element["profile_path"] ?? ""
          };
          i++;
        }
      }
      return castList;
    } else {
      return null;
    }
  }
}
