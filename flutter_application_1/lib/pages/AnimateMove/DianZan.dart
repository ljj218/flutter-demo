/*
 * @Author: long_jj
 * @Date: 2021-08-25 10:23:28
 * @LastEditTime: 2021-08-25 14:59:30
 * @LastEditors: long_jj
 * @Description:  AnimationController 仅仅是控制器 返回0-1的值 需要其他的值 使用Animation tween
 * @FilePath: \flutter_application_1\lib\pages\AnimateMove\DianZan.dart
 */

import 'package:flutter/material.dart';

class DianZan extends StatefulWidget {
  DianZan({Key? key}) : super(key: key);

  @override
  _DianZanState createState() => _DianZanState();
}

class _DianZanState extends State<DianZan> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late CurvedAnimation curve;
  late Animation animationSize;
  bool color = false;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    // curve =
    //     CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc);

    animationSize = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 30.0, end: 40.0)
              .chain(CurveTween(curve: Curves.easeInCirc)),
          weight: 50),
      TweenSequenceItem(tween: Tween(begin: 40.0, end: 30.0), weight: 50),
    ]).animate(_animationController);

    _animationController.addListener(() {
      print(_animationController.status);
      if (_animationController.status == AnimationStatus.forward) {
        // _animationController.reverse();
        color = true;
      }
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset();
      }
      if (_animationController.status == AnimationStatus.dismissed) {
        // color = false;
        // _animationController.reverse();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('点赞'),
        GestureDetector(
          onTapDown: (e) {
            _animationController.forward();
          },
          child: Container(
            color: Colors.blue,
            width: 30,
            height: 30,
            child: Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    //随着值的变大 size变大 到一定大小 缩小
                    return Icon(
                      Icons.favorite,
                      color: color ? Colors.red : Colors.grey,
                      size: animationSize.value,
                    );
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
