/*
 * @Author: long_jj
 * @Date: 2021-08-11 14:22:36
 * @LastEditTime: 2021-08-11 16:42:17
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\Key\key.dart
 */

import 'package:flutter/material.dart';

class KeyPage extends StatefulWidget {
  KeyPage({Key? key}) : super(key: key);

  @override
  _KeyPageState createState() => _KeyPageState();
}

class _KeyPageState extends State<KeyPage> {
  GlobalKey _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('flutter中key的使用'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(ValueKey(2)),
            Box(_key),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // final state= (_key.currentState _BoxState);  //获取key状态属性
          // state._count
          // final widget = (_key.currentWidget as Box); //获取元素属性值
          RenderBox renderBox =
              (_key.currentContext!.findRenderObject() as RenderBox); //获取元素属性值
          print(renderBox.size); //尺寸
          print(renderBox.localToGlobal(Offset.zero)); //位置
        },
      ),
    );
  }
}

// ignore: must_be_immutable
class Box extends StatefulWidget {
  Box(Key key) : super(key: key);

  @override
  _BoxState createState() => _BoxState();
}

class _BoxState extends State<Box> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _count++;
        });
      },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.grey,
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade100,
            ),
          ),
        ),
        child: Center(
          child: Text(
            '$_count',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
