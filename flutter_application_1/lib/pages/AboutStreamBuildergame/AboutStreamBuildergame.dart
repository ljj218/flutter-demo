/*
 * @Author: Long_jj
 * @Date: 2021-08-18 21:11:39
 * @LastEditTime: 2021-08-18 22:40:02
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/AboutStreamBuildergame/AboutStreamBuildergame.dart
 */

import 'dart:async';

import 'package:flutter/material.dart';

class AboutStreamBuilderGamePage extends StatefulWidget {
  AboutStreamBuilderGamePage({Key? key}) : super(key: key);

  @override
  _AboutStreamBuildergamePageState createState() => _AboutStreamBuildergamePageState();
}

class _AboutStreamBuildergamePageState extends State<AboutStreamBuilderGamePage> {
  StreamController _controller = StreamController();

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('you enter: ${snapshot.data}');
              }
              return Text('wating...');
            }),
      ),
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('1111'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: KeyPad(_controller),
          )
        ],
      ),
    );
  }
}

class KeyPad extends StatelessWidget {
  final _controller;
  const KeyPad(this._controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 2 / 1,
      shrinkWrap: true, //设为true 确定其高度 默认是 false 无限高 自动撑高
      physics: NeverScrollableScrollPhysics(),
      children: List.generate(
        9,
        (index) => ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.primaries[index].shade500),
            //边框
            side: MaterialStateProperty.all(
              BorderSide(
                color: Colors.primaries[index].shade200,
                width: 1,
                style: BorderStyle.solid,
              ),
            ),
            shape: MaterialStateProperty.all(
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(0)),
            ),
          ),
          onPressed: () {
            _controller.add(index + 1);
          },
          child: Text('${index + 1}'),
        ),
      ),
    );
  }
}
