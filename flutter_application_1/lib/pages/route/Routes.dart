/*
 * @Author: long_jj
 * @Date: 2021-07-27 09:04:09
 * @LastEditTime: 2021-07-30 15:50:23
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\route\Routes.dart
 */
import 'package:flutter/material.dart';

import '../NewsDateal.dart';
import '../tabs/Tabs.dart';
import '../Deatail.dart';
import '../tabBarPage/TabBarPage.dart';
import '../tabBarController/TabBarController.dart';
import '../textField/TextField.dart';
import '../check/check.dart';
import '../datePicker/DatePicker.dart';
import '../dialog/Dialog.dart';
import '../customDialog/CustomDialog.dart';

final routes = {
  '/': (context) => Tabs(),
  '/newsDetail': (context, {arguments}) => NewsDetail(arguments: arguments),
  '/Detail': (context, {arguments}) => Detail(arguments: arguments),
  '/TabBarPage': (context) => TabBarPage(),
  '/TabBarControllerPage': (context) => TabBarControllerPage(),
  '/TryTextField': (context) => TryTextField(),
  '/CheckRadio': (context) => CheckRadio(),
  '/DatePickerPage': (context) => DatePickerPage(),
  '/DialogPage': (context) => DialogPage(),
  '/CustomDialogPage': (context) => CustomDialogPage(),
};

// ignore: top_level_function_literal_block
var onGenerateRoute = (RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
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
      final Route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return Route;
    }
  }
};
