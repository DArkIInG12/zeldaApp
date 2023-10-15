import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project1/models/popular_model.dart';

class ApiPopular {
  Uri link = Uri.parse(
      "https://api.themoviedb.org/3/movie/popular?api_key=5019e68de7bc112f4e4337a500b96c56&language=es-MX&page=1%27)");

  Future<List<PopularModel>?> getAllPopular() async {
    var response = await http.get(link);

    if (response.statusCode == 200) {
      var jsonRes = jsonDecode(response.body)["results"] as List;
      return jsonRes.map((popular) => PopularModel.fromMap(popular)).toList();
    } else {
      return null;
    }
  }
}
