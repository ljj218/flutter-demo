/*
 * @Author: long_jj
 * @Date: 2021-08-17 10:09:08
 * @LastEditTime: 2021-08-17 22:08:57
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/FutureBuilder/FutureBuilder.dart
 */

import 'dart:ui';

import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('futureBuilder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
              Duration(
                seconds: 1,
              ),
              () => 222),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 30),
              );
            }
            if (snapshot.hasError) {
              return Icon(Icons.error, size: 80);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
