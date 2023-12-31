import 'dart:convert';

import 'package:covid_19_tracker/models/all_countries_model.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/resources/api_constrants.dart';
import 'package:http/http.dart' as http;

class CountriesAPi {
  Future<AllCountriesModel> fetchData() async {
    var response = await http.get(Uri.parse(ApiUrl.countriesList));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return AllCountriesModel.fromJson(data);
    } else {
      debugPrint("Cannot fetch API WORLD STATS");
      throw Exception('Error');
    }
  }
}
