/*
 * @Author: long_jj
 * @Date: 2021-07-14 09:45:44
 * @LastEditTime: 2021-08-17 10:15:18
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabs\News.dart
 */
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ElevatedButton(
          child: Text('命名跳转 带参数'),
          onPressed: () {
            Navigator.pushNamed(context, '/newsDetail', arguments: '我是命名传参');
          },
        ),
        ElevatedButton(
          child: Text('futureBuilder'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/newsDetail',
            );
          },
        ),
      ],
    );
  }
}
