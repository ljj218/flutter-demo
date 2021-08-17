/*
 * @Author: long_jj
 * @Date: 2021-07-13 14:14:21
 * @LastEditTime: 2021-08-17 10:10:27
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main.dart
 */
import 'package:flutter/material.dart';

import 'route/Routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

//生成全局的 NavigatorState key 获取context  在其他页面 可以通过 navigatorkey.currentContxt 替代context
final GlobalKey<NavigatorState> navigatorkey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: onGenerateRoute,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('zh', 'CH'),
        Locale('en', 'US'),
      ],
    );
  }
}
