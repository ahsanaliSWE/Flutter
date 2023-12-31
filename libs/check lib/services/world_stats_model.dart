import 'dart:convert';
import 'package:covid_19_tracker/models/world_stats.dart';
import 'package:covid_19_tracker/resources/api_constrants.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class WorldStats {
  Future<WorldStatsModel> fetchData() async {
    var response = await http.get(Uri.parse(ApiUrl.wroldStatesApi));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return WorldStatsModel.fromJson(data);
    } else {
      debugPrint("Cannot fetch API WORLD STATS");
      throw Exception('Error');
    }
  }
}
