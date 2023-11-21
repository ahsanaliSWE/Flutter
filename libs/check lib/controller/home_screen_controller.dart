import 'package:covid_19_tracker/models/world_stats.dart';
import 'package:covid_19_tracker/services/world_stats_model.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class HomeScreenController extends GetxController {
  List<Color> pieChartColors = [Colors.blue, Colors.green, Colors.red];
  Rx<WorldStatsModel> datas = WorldStatsModel().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProucts();
  }

  Future<void> fetchProucts() async {
    isLoading.value = true;
    datas.value = await WorldStats().fetchData();
    isLoading.value = false;
  }
}
