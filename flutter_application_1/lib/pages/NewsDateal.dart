/*
 * @Author: long_jj
 * @Date: 2021-07-15 09:18:45
 * @LastEditTime: 2021-08-24 17:16:59
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\NewsDateal.dart
 */
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsDetail extends StatefulWidget {
  String arguments;
  NewsDetail({required this.arguments});

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  @override
  Widget build(BuildContext context) {
    //通过 ModalRoute.of(context) 获取参数
    // final _message = ModalRoute.of(context)?.settings.arguments;
    // print(ModalRoute.of(context)?.settings.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('sss'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            for (var i = 0; i < 20; i++)
              ListTile(
                title: Text('$widget.arguments '),
              ),
            Container(
              width: 399,
              height: 33,
              color: Color.fromARGB(100, 222, 3, 34),
            )
          ],
        ),
      ),
    );
  }
}
