/*
 * @Author: long_jj
 * @Date: 2021-08-25 15:55:32
 * @LastEditTime: 2021-08-25 16:32:41
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimateMove\DianZan2.dart
 */
import 'dart:math';

import 'package:flutter/material.dart';

import './_circleAnimation.dart';

class DianZan2 extends StatefulWidget {
  DianZan2({Key? key}) : super(key: key);

  @override
  _DianZan2State createState() => _DianZan2State();
}

class _DianZan2State extends State<DianZan2>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  late Animation<double> _iconAnimation;

  bool like = true;

  late Animation<double> _circleAnimation;

  @override
  initState() {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);

    _iconAnimation = Tween(begin: 1.0, end: 1.3).animate(_animationController);

    _iconAnimation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 1.0, end: 1.3)
              .chain(CurveTween(curve: Curves.easeIn)),
          weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
    ]).animate(_animationController);
    _circleAnimation =
        Tween(begin: 1.0, end: 0.0).animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: GestureDetector(
        onTap: () {
          if (_iconAnimation.status == AnimationStatus.forward ||
              _iconAnimation.status == AnimationStatus.reverse) {
            return;
          }
          setState(() {
            like = !like;
          });
          if (_iconAnimation.status == AnimationStatus.dismissed) {
            _animationController.forward();
          } else if (_iconAnimation.status == AnimationStatus.completed) {
            _animationController.reverse();
          }
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: _buildCirclePoints(),
            ),
            Positioned(
              child: CircleAnimation(
                circleAnimationc: _circleAnimation,
                like: like,
              ),
            ),
            Positioned(
              child: _buildLikeIcon(),
            ),
          ],
        ),
      ),
    );
  }

  _buildLikeIcon() {
    return ScaleTransition(
      scale: _iconAnimation,
      child: like
          ? Icon(Icons.favorite)
          : Icon(
              Icons.favorite,
              color: Colors.red,
            ),
    );
  }

  _buildCirclePoint(double radius, Color color) {
    return like
        ? Container()
        : AnimatedBuilder(
            animation: _circleAnimation,
            builder: (context, child) {
              return Container(
                width: radius,
                height: radius,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: color.withOpacity(_circleAnimation.value)),
              );
            },
          );
  }

  _buildCirclePoints() {
    return Flow(
      delegate: CirclePointFlowDelegate(),
      children: <Widget>[
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
        _buildCirclePoint(2, Color(0xFF97B1CE)),
        _buildCirclePoint(5, Color(0xFF4AC6B7)),
      ],
    );
  }
}

class CirclePointFlowDelegate extends FlowDelegate {
  @override
  void paintChildren(FlowPaintingContext context) {
    var radius = 18.0;
    //中心点
    double rx = radius;
    double ry = radius;
    for (int i = 0; i < context.childCount; i++) {
      if (i % 2 == 0) {
        double x =
            rx + (radius - 5) * cos(i * 2 * pi / (context.childCount - 1));
        double y =
            ry + (radius - 5) * sin(i * 2 * pi / (context.childCount - 1));
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      } else {
        double x = rx +
            (radius - 5) *
                cos((i - 1) * 2 * pi / (context.childCount - 1) +
                    2 * pi / ((context.childCount - 1) * 3));
        double y = ry +
            (radius - 5) *
                sin((i - 1) * 2 * pi / (context.childCount - 1) +
                    2 * pi / ((context.childCount - 1) * 3));
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
      }
    }
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) => true;
}
