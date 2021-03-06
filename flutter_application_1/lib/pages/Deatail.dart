/*
 * @Author: Long_jj
 * @Date: 2021-07-26 20:24:59
 * @LastEditTime: 2021-08-23 17:00:10
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\Deatail.dart
 */
import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  String arguments;

  Detail({this.arguments = '我是详情页面'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.arguments),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blue[300],
        child: Stack(
          children: <Widget>[
            Container(
              width: 300,
              height: 400,
              color: Colors.red,
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                child: Text('我是定位'),
                width: 60,
                height: 60,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigator.pop(context, mp);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => Tabs(index: 1)),
                    (route) => false);
              },
              child: Text('pop返回'),
            ),
          ],
        ),
      ),
    );
  }
}
