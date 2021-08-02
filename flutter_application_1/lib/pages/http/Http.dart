import 'dart:convert';

import 'package:flutter/material.dart';

class HttpPage extends StatefulWidget {
  HttpPage({Key? key}) : super(key: key);

  @override
  _HttpPageState createState() => _HttpPageState();
}

class _HttpPageState extends State<HttpPage> {
  Map<String, dynamic> obj = {'name': '历史', 'age': 20};

  @override
  void initState() {
    super.initState();
    String str = json.encode(obj);
    print(str);
  }

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
