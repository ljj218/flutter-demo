import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          child: Text('命名跳转'),
          onPressed: () {
            Navigator.pushNamed(context, '/newsDetail', arguments: '我是命名传参');
          },
        ),
      ),
    );
  }
}
