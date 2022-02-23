// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../ui/views/home/home_view.dart';
import '../ui/views/home/start_view/start_view.dart';

class Routes {
  static const String homeView = '/';
  static const String startView = '/start-view';
  static const all = <String>{
    homeView,
    startView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.startView, page: StartView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    HomeView: (data) {
      var args = data.getArgs<HomeViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(key: args.key),
        settings: data,
      );
    },
    StartView: (data) {
      var args = data.getArgs<StartViewArguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => StartView(key: args.key),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// HomeView arguments holder class
class HomeViewArguments {
  final Key key;
  HomeViewArguments({required this.key});
}

/// StartView arguments holder class
class StartViewArguments {
  final Key key;
  StartViewArguments({required this.key});
}
