/*
 * @Author: long_jj
 * @Date: 2021-08-09 15:48:05
 * @LastEditTime: 2021-08-09 17:25:09
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\rotationTransiton\RotationTransiton.dart
 */
import 'package:flutter/material.dart';

class RotationTransitionPage extends StatefulWidget {
  RotationTransitionPage({Key? key}) : super(key: key);

  @override
  _RotationTransitionPageState createState() => _RotationTransitionPageState();
}

class _RotationTransitionPageState extends State<RotationTransitionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation _animation;

  bool flag = false;

  @override
  void initState() {
    _controller = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    // 可以挂在 Animation 进行详细设置 然后 turns 可以设置成 _animation
    // _animation = Tween(begin: .0, end: .5).animate(_controller);
    super.initState();
  }

  //初始化的方法 记得销毁
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('旋转动画'),
        ),
        body: Center(
          child: RotationTransition(
            turns: _controller,
            // turns: _controller.drive(Tween(begin: .0, end: .5)),
            // turns:Tween(begin: .0, end: .5).animate(_controller),  //可以叠加复写很多Tween ,chain(CurveTween(curve:Interval(0.8,1)))  相当于deley
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // _controller.forward();
            if (this.flag) {
              _controller.stop();
              // _controller.reset();
            } else {
              _controller.repeat();
            }
            this.flag = !this.flag;
          },
          child: Text('START'),
        ),
      ),
    );
  }
}
