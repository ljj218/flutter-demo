/*
 * @Author: long_jj
 * @Date: 2021-08-19 09:07:44
 * @LastEditTime: 2021-08-19 09:11:29
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\FutureBuilder\FutureBuilder.dart
 */
import 'package:flutter/material.dart';

class FutureBuilderPage extends StatefulWidget {
  FutureBuilderPage({Key? key}) : super(key: key);

  @override
  _FutureBuilderPageState createState() => _FutureBuilderPageState();
}

class _FutureBuilderPageState extends State<FutureBuilderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('futureBuilder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(
              Duration(
                seconds: 1,
              ),
              () => 222),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 30),
              );
            }
            if (snapshot.hasError) {
              return Icon(Icons.error, size: 80);
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
