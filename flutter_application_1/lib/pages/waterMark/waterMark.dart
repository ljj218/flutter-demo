/*
 * @Author: long_jj
 * @Date: 2021-08-26 14:19:58
 * @LastEditTime: 2021-08-26 15:13:19
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\waterMark\waterMark.dart
 */
import 'dart:ui';

import 'package:flutter/material.dart';

class WaterMarkDemo extends StatefulWidget {
  String watermark;

  Widget child;

  WaterMarkDemo({Key? key, required this.child, required this.watermark})
      : super(key: key);

  @override
  _WaterMarkDemoState createState() => _WaterMarkDemoState();
}

class _WaterMarkDemoState extends State<WaterMarkDemo> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        ImageFiltered(
          imageFilter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: widget.child,
        ),
        Positioned.fill(
          child: Container(
            // color: Colors.blue[100],
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(-0.78),
            transformAlignment: Alignment.center,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                // color: Colors.red[100],
                child: FittedBox(
                    //按照父元素的宽高 缩放子元素 我们等比拉伸或者填充父组件
                    child: Text(
                  widget.watermark,
                  // textScaleFactor: 100,
                )),
              ),
            ),
          ),
        )
      ],
    );
  }
}
