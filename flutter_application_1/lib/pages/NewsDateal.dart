import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('新闻详细页面'),
      ),
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
            )
          ],
        ),
      ),
    );
  }
}
