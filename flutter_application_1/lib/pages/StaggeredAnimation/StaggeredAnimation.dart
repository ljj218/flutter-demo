/*
 * @Author: Long_jj
 * @Date: 2021-08-09 21:30:08
 * @LastEditTime: 2021-08-10 09:55:10
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\StaggeredAnimation\StaggeredAnimation.dart
 */

import 'package:flutter/material.dart';

class StaggeredAnimationPage extends StatefulWidget {
  StaggeredAnimationPage({Key? key}) : super(key: key);

  @override
  _StaggeredAnimationPageState createState() => _StaggeredAnimationPageState();
}

class _StaggeredAnimationPageState extends State<StaggeredAnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 4000),
    )..repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(
          title: Text('交错动画 - 管理区间和曲线'),
        ),
        body: Center(
          child: Column(
            children: [
              slide(
                color: Colors.blue.shade100,
                tween: Tween(begin: Offset.zero, end: Offset(0.1, 0)),
                interval: Interval(0.0, 0.2),
                controller: _controller,
              ),
              slide(
                color: Colors.blue.shade300,
                tween: Tween(begin: Offset.zero, end: Offset(0.1, 0)),
                interval: Interval(0.2, 0.4),
                controller: _controller,
              ),
              slide(
                color: Colors.blue.shade500,
                tween: Tween(begin: Offset.zero, end: Offset(0.1, 0)),
                interval: Interval(0.4, 0.6),
                controller: _controller,
              ),
              slide(
                color: Colors.blue.shade700,
                tween: Tween(begin: Offset.zero, end: Offset(0.1, 0)),
                interval: Interval(0.6, 0.8),
                controller: _controller,
              ),
              slide(
                color: Colors.blue.shade900,
                tween: Tween(begin: Offset.zero, end: Offset(0.1, 0)),
                interval: Interval(0.8, 1.0),
                controller: _controller,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('+'),
        ),
      ),
      onWillPop: () async {
        var ss = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('您确定退出吗？'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: Text('取消'),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text('确定'))
              ],
            );
          },
        );
        return ss;
      },
    );
  }
}

class slide extends StatelessWidget {
  Animation<double> controller;
  Interval interval;
  Color color;
  Tween<Offset> tween;
  slide(
      {Key? key,
      required this.controller,
      required this.interval,
      required this.color,
      required this.tween})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: tween.chain(CurveTween(curve: interval)).animate(controller),
      child: Container(
        width: 300,
        height: 50,
        color: color,
      ),
    );
  }
}
