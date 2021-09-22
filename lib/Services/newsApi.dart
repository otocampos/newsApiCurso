import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app_aula/Constantes/endPointsRotas.dart';
import 'package:news_app_aula/Models/Articles.dart';
import 'package:news_app_aula/Models/Results.dart';

class serviceNewsApi {

  static Future<List<Articles>?> getTopHeadLines() async {
    var url = endPoints.URL_ENDPOINT_HEADLINES_ALL;
    Map<String, String> header = {
      "Content-Type": "application/json",
    };

    http.Response response = await http.get(url, headers: header);

    Map<String, dynamic> mapResults = json.decode(response.body);

    var results = Results.fromJson(mapResults);

    return results.articles;
  }
}
