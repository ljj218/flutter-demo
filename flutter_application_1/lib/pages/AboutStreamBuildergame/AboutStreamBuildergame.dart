/*
 * @Author: Long_jj
 * @Date: 2021-08-18 21:11:39
 * @LastEditTime: 2021-08-19 15:21:38
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AboutStreamBuildergame\AboutStreamBuildergame.dart
 */

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class AboutStreamBuilderGamePage extends StatefulWidget {
  AboutStreamBuilderGamePage({Key? key}) : super(key: key);

  @override
  _AboutStreamBuildergamePageState createState() =>
      _AboutStreamBuildergamePageState();
}

class _AboutStreamBuildergamePageState
    extends State<AboutStreamBuilderGamePage> {
  StreamController<int> _controller = StreamController.broadcast();

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
          Puzzle(_controller.stream),
          Align(
            alignment: Alignment.bottomCenter,
            child: KeyPad(_controller),
          )
        ],
      ),
    );
  }
}

//题目
class Puzzle extends StatefulWidget {
  final Stream<int> inputStream;
  Puzzle(this.inputStream);

  @override
  _PuzzleState createState() => _PuzzleState(inputStream);
}

class _PuzzleState extends State<Puzzle> with SingleTickerProviderStateMixin {
  late int a, b;
  late double x, y;
  late AnimationController _animationController;
  late Color color;

  Stream<int> inputStream;
  _PuzzleState(this.inputStream);

  reset() {
    color =
        Colors.primaries[Random().nextInt(Colors.primaries.length)].shade200;
    a = Random().nextInt(5) + 1;
    b = Random().nextInt(5);
    x = Random().nextDouble() * 400;
    _animationController.duration = Duration(seconds: 5 + Random().nextInt(5));
    _animationController.forward();
  }

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    //初始 _PuzzleState 的状态 以及 AnimationController 注意先后
    reset();
    //监听动画的状态 结束=》重置
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        reset();
        _animationController.forward(from: 0.0);
      }
    });

    //stream 监听输入
    inputStream.listen((event) {
      if (event == (a + b)) {
        reset();
        _animationController.forward(from: 0.0);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Positioned(
            top:
                _animationController.value * MediaQuery.of(context).size.height,
            left: x,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text('$a + $b'),
            ),
          );
        });
  }
}

class KeyPad extends StatelessWidget {
  final _controller;
  const KeyPad(this._controller);

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
            backgroundColor:
                MaterialStateProperty.all(Colors.primaries[index].shade500),
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
