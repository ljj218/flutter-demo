/*
 * @Author: Long_jj
 * @Date: 2021-08-10 21:19:27
 * @LastEditTime: 2021-08-10 22:04:52
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/CustomPaint/CustomPaint.dart
 */

import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintPage extends StatefulWidget {
  CustomPaintPage({Key? key}) : super(key: key);

  @override
  _CustomPaintPageState createState() => _CustomPaintPageState();
}

class _CustomPaintPageState extends State<CustomPaintPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  List<Snowflake> snowFlake = List.generate(200, (index) => Snowflake());

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1))..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义画笔'),
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blue,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue, Colors.white],
                  stops: [0.7, 0.95])),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              snowFlake.forEach((item) {
                item.fall();
              });
              return CustomPaint(
                painter: Mypaint(snowFlake),
              );
            },
          )),
    );
  }
}

class Mypaint extends CustomPainter {
  List<Snowflake> snowFlake;

  Mypaint(this.snowFlake);
  //初始化画笔
  Paint _paint = Paint()..color = Colors.white;

  @override
  void paint(Canvas canvas, Size size) {
    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 40, _paint);
    canvas.drawCircle(size.center(Offset(0, 70)), 40, _paint);
    canvas.drawOval(Rect.fromCenter(center: size.center(Offset(0, 200)), width: 150, height: 200), _paint);
    snowFlake.forEach((item) {
      canvas.drawCircle(Offset(item.x, item.y), item.radius, _paint);
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Snowflake {
  double x = Random().nextDouble() * 400;
  double y = Random().nextDouble() * 700;
  double velocity = Random().nextDouble() * 2 + 4;
  double radius = Random().nextDouble() * 2 + 4;

  fall() {
    y += velocity;
    if (y > 700) {
      y = 0;
      x = Random().nextDouble() * 400;
      velocity = Random().nextDouble() * 1 + 4;
      radius = Random().nextDouble() * 1 + 3;
    }
  }
}
