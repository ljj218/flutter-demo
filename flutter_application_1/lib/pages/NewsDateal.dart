/*
 * @Author: long_jj
 * @Date: 2021-07-15 09:18:45
 * @LastEditTime: 2021-08-12 17:01:51
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
    // final _message = ModalRoute.of(context)?.settings.arguments;
    // print(ModalRoute.of(context)?.settings.toString());
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('$widget.arguments '),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
            ),
            ListTile(
              title: Text('新闻详细~~~'),
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
