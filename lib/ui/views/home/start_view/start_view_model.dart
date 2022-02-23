import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class StartViewModel extends BaseViewModel {
  int _currentIndex = 0;

  double _leftWidth = 0;

  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  // List<Map> mainViews = [
  //   {
  //     "view": ChatView(),
  //     "image": "assets/images/messenger.svg",
  //   },
  //   {
  //     "view": ShoesView(),
  //     "image": "assets/images/shoes.svg",
  //     "fit": BoxFit.fitWidth,
  //   },
  //   {
  //     "view": HomeMainView(),
  //     "image": "assets/images/home.svg",
  //   },
  //   {
  //     "view": TodayMealsView(),
  //     "image": "assets/images/meal.svg",
  //   },
  //   {
  //     "view": SleepView(),
  //     "image": "assets/images/night.svg",
  //   }
  // ];

  double get leftWidth => _leftWidth;

  int get currentIndex => _currentIndex;

  changeIndex({required int index, required double width}) {
    _currentIndex = index;
    _leftWidth = width;
    notifyListeners();
  }

  void openMyDrawer() {
    scaffoldkey.currentState!.openDrawer();
  }
}
