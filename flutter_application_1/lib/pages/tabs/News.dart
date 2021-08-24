/*
 * @Author: long_jj
 * @Date: 2021-07-14 09:45:44
<<<<<<< HEAD
 * @LastEditTime: 2021-08-24 11:37:15
 * @LastEditors: long_jj
=======
 * @LastEditTime: 2021-08-18 21:14:17
 * @LastEditors: Long_jj
>>>>>>> 3c1853e9054828e62bde69617794a8f61471e12d
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
        ElevatedButton(
          child: Text('StreamBuilderPage'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/StreamBuilderPage',
            );
          },
        ),
        ElevatedButton(
          child: Text('AboutStreamBuilderGamePage'),
          onPressed: () {
            Navigator.pushNamed(
              context,
              '/AboutStreamBuilderGamePage',
            );
          },
        ),
        Container(
          padding: EdgeInsets.all(5),
          color: Colors.blue[200],
          child: ListTile(
            title: Text("ValueListenableBuilder"),
            subtitle: Text('局部监听值变化刷新的组件'),
            onTap: () {
              Navigator.pushNamed(context, '/ValueListenablebuilderPage');
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.blue[200],
          child: ListTile(
            title: Text("高德定位测试"),
            subtitle: Text('高德定位测试'),
            onTap: () {
              Navigator.pushNamed(context, '/LocationPage');
            },
          ),
        ),
        Container(
          margin: EdgeInsets.all(5),
          color: Colors.blue[200],
          child: ListTile(
            title: Text("CustomMultiChildlayout"),
            subtitle: Text('自定义 布局'),
            onTap: () {
              Navigator.pushNamed(context, '/CustomMultiChildlayoutPage');
            },
          ),
        )
      ],
    );
  }
}
