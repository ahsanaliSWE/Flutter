import 'package:covid_19_tracker/screens/profile_screen.dart';
import 'package:covid_19_tracker/screens/search_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../screens/home_page.dart';

class NavBarController extends GetxController {
  List<Widget> screens = const [HomePage(), SearchPage(), ProfileScreen()];
  RxInt selectedIndex = 0.obs;
}
