/*
 * @Author: long_jj
 * @Date: 2021-07-13 14:14:21
 * @LastEditTime: 2021-07-29 15:51:05
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\main.dart
 */
import 'package:flutter/material.dart';

import 'pages/route/Routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
