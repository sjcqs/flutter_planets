import 'dart:convert';

import 'package:planets/constants.dart';
import 'package:planets/data/model/apod/apod.dart';
import 'package:http/http.dart' as http;

class ApodRepository {
  static const URL = "https://api.nasa.gov/planetary/apod?api_key=";

  static Future<Apod> fetchApod() async {
    final response = await http.get("$URL${Constants.NASA_API_KEY}");
    if (response.statusCode == 200) {
      return Apod.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load astronomy object of the day");
    }
  }
}
