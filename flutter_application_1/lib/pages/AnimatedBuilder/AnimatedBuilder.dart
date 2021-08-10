/*
 * @Author: long_jj
 * @Date: 2021-08-10 10:04:58
 * @LastEditTime: 2021-08-10 14:00:16
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimatedBuilder\AnimatedBuilder.dart
 */

import 'package:flutter/material.dart';

class AnimatedBuilderPage extends StatefulWidget {
  AnimatedBuilderPage({Key? key}) : super(key: key);

  @override
  _AnimatedBuilderPageState createState() => _AnimatedBuilderPageState();
}

class _AnimatedBuilderPageState extends State<AnimatedBuilderPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  bool flag = false;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //两种写法
    final Animation heightAnimation =
        Tween<double>(begin: 200, end: 400).animate(_animationController);

    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('自定义动画'),
        ),
        body: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Center(
              child: Container(
                // width: 200,
                width: Tween<double>(begin: 200, end: 400)
                    .evaluate(_animationController),
                height: 200 + 100 * _animationController.value,
                // height: Tween<double>(begin: 200, end: 400)
                //     .evaluate(_animationController),
                color: Colors.blue,
                child: child,
              ),
            );
          },
          child: Center(
            child: Text(
              'Hi',
              style: TextStyle(fontSize: 40),
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (this.flag) {
              _animationController.stop();
              // _controller.reset();
            } else {
              _animationController.repeat();
            }
            this.flag = !this.flag;
          },
          child: Text('+'),
        ),
      ),
    );
  }
}
