import 'package:flutter/material.dart';

class HttpPage extends StatefulWidget {
  HttpPage({Key? key}) : super(key: key);

  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http 请求'),
      ),
      body: Container(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
