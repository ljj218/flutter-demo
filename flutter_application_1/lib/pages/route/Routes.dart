import 'package:flutter/material.dart';

import '../NewsDateal.dart';
import '../tabs/Tabs.dart';
import '../Deatail.dart';
import '../tabBarPage/TabBarPage.dart';
import '../tabBarController/TabBarController.dart';

final routes = {
  '/': (context) => Tabs(),
  '/newsDetail': (context, {arguments}) => NewsDetail(arguments: arguments),
  '/Detail': (context, {arguments}) => Detail(arguments: arguments),
  '/TabBarPage': (context) => TabBarPage(),
  '/TabBarControllerPage': (context) => TabBarControllerPage(),
};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  // ignore: unnecessary_null_comparison
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      // ignore: non_constant_identifier_names
      final Route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return Route;
    } else {
      // ignore: non_constant_identifier_names
      print("object");
      // ignore: non_constant_identifier_names
      final Route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return Route;
    }
  }
};
