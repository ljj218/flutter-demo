/*
 * @Author: long_jj
 * @Date: 2021-08-17 10:09:08
 * @LastEditTime: 2021-08-17 10:29:49
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\FutureBuilder\FutureBuilder.dart
 */

import 'package:flutter/material.dart';

var _future = Future.delayed(Duration(seconds: 3), () {
  return '老孟，一个有态度的程序员';
});

class FutureBuilderPage extends StatelessWidget {
  const FutureBuilderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('futureBuilder'),
      ),
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          var widget;
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              widget = Icon(
                Icons.error,
                color: Colors.red,
                size: 48,
              );
            } else {
              widget = Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 36,
              );
            }
          } else {
            widget = Padding(
              padding: EdgeInsets.all(20),
              child: CircularProgressIndicator(),
            );
          }

          return Center(
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: widget,
            ),
          );
        },
      ),
    );
  }
}
