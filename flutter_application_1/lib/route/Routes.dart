/*
 * @Author: long_jj
 * @Date: 2021-08-19 09:07:58
 * @LastEditTime: 2021-08-25 15:33:41
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\route\Routes.dart
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/customScrollView/CustomScrollView.dart';

import '../tool/CirclePageRoute.dart';

import '/pages/NewsDateal.dart';
import '/pages/tabs/Tabs.dart';
import '/pages/Deatail.dart';
import '/pages/tabBarPage/TabBarPage.dart';
import '/pages/tabBarController/TabBarController.dart';
import '/pages/textField/TextField.dart';
import '/pages/check/check.dart';
import '/pages/datePicker/DatePicker.dart';
import '/pages/dialog/Dialog.dart';
import '/pages/customDialog/CustomDialog.dart';
import '/pages/customScrollView/CustomScrollView.dart';
import '/pages/refresh/refresh.dart';
import '/pages/flexBox/FlexBox.dart';
import '/pages/AnimatedContainer/AnimatedContainer.dart';
import '/pages/AnimatedSwitcher/AnimatedSwitcher.dart';
import '/pages/hero/hero.dart';
import '/pages/moreAnimated/moreAnimated.dart';
import '/pages/tweenAnimationBuilder/tweenAnimationBuilder.dart';
import '/pages/rotationTransiton/RotationTransiton.dart';
import '/pages/StaggeredAnimation/StaggeredAnimation.dart';
import '/pages/AnimatedBuilder/AnimatedBuilder.dart';
import '/pages/AnimateMove/AnimateMove.dart';
import '/pages/CustomPaint/CustomPaint.dart';
import '/pages/Key/Key.dart';
import '/pages/DragTheSorting/DragTheSorting.dart';
import '/pages/myDragSorting/myDragSorting.dart';
import '/pages/FutureBuilder/FutureBuilder.dart';
import '/pages/streamBuilder/streamBuilder.dart';
import '/pages/AboutStreamBuildergame/AboutStreamBuildergame.dart';
import '/pages/ValueListenablebuilder/ValueListenablebuilder.dart';
import '/pages/Location/Location.dart';
import '/pages/CustomMultiChildlayout/CustomMultiChildlayout.dart';
import '/pages/OrientationBuilderTest/OrientationBuilderTest.dart';

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
  '/CustomScrollView': (context) => CustomScrollViewPage(),
  '/RefreshPage': (context) => RefreshPage(),
  '/FlexBoxPage': (context) => FlexBoxPage(),
  '/AnimatedContainerPage': (context) => AnimatedContainerPage(),
  '/AnimatedSwitcherPage': (context) => AnimatedSwitcherPage(),
  '/Hero1Demo': (context) => Hero1Demo(),
  '/MoreAnimatedPage': (context) => MoreAnimatedPage(),
  '/TweenAnimationBuilderPage': (context) => TweenAnimationBuilderPage(),
  '/RotationTransitonPage': (context) => RotationTransitionPage(),
  '/StaggeredAnimationPage': (context) => StaggeredAnimationPage(),
  '/AnimatedBuilderPage': (context) => AnimatedBuilderPage(),
  '/AnimateMovePage': (context) => AnimateMovePage(),
  '/CustomPaintPage': (context) => CustomPaintPage(),
  '/KeyPage': (context) => KeyPage(),
  '/DragTheSortingPage': (context) => DragTheSortingPage(),
  '/MyDragSortingPage': (context) => MyDragSortingPage(),
  '/FutureBuilderPage': (context) => FutureBuilderPage(),
  '/StreamBuilderPage': (context) => StreamBuilderPage(),
  '/AboutStreamBuilderGamePage': (context) => AboutStreamBuilderGamePage(),
  '/ValueListenablebuilderPage': (context) => ValueListenablebuilderPage(),
  '/LocationPage': (context) => LocationPage(),
  '/CustomMultiChildlayoutPage': (context) => CustomMultiChildlayoutPage(),
  '/OrientationBuilderTestPage': (context) => OrientationBuilderTestPage(),
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
          CupertinoPageRoute(builder: (context) => pageContentBuilder(context));
      // final Route =
      //     CirclePageRoute(builder: (context) => pageContentBuilder(context));
      return Route;
    }
  }
};
