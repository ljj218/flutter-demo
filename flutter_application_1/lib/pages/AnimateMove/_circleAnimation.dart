/*
 * @Author: long_jj
 * @Date: 2021-08-25 15:37:54
 * @LastEditTime: 2021-08-25 16:31:55
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimateMove\_circleAnimation.dart
 */
import 'package:flutter/material.dart';

class CircleAnimation extends StatefulWidget {
  bool like;
  late Animation circleAnimationc;
  CircleAnimation({Key? key, this.like = false, required this.circleAnimationc})
      : super(key: key);

  @override
  _CircleAnimationState createState() => _CircleAnimationState();
}

class _CircleAnimationState extends State<CircleAnimation> {
  @override
  Widget build(BuildContext context) {
    return widget.like
        ? Container()
        : AnimatedBuilder(
            animation: widget.circleAnimationc,
            builder: (context, child) {
              print(widget.circleAnimationc.value);
              return Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color(0xFF5FA0EC)
                            .withOpacity(widget.circleAnimationc.value),
                        width: widget.circleAnimationc.value * 3)),
              );
            },
          );
  }
}
