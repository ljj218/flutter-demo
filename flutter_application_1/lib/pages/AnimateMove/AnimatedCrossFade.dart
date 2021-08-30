/*
 * @Author: long_jj
 * @Date: 2021-08-25 16:55:16
 * @LastEditTime: 2021-08-26 10:32:11
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimateMove\AnimatedCrossFade.dart
 */

import 'package:flutter/material.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  AnimatedCrossFadeDemo({Key? key}) : super(key: key);

  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool _show = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _show = !_show;
          });
        },
        child: AnimatedCrossFade(
            firstChild: Image.network(
              'https://static.51sdx.com/_nuxt/img/xkzhfx.1ccfcda.png',
              fit: BoxFit.cover,
            ),
            secondChild: Image.network(
              'https://static.51sdx.com/_nuxt/img/xkyqcx.7631fc9.png',
              fit: BoxFit.cover,
            ),
            firstCurve: Interval(0.0, 0.5),
            secondCurve: Interval(0.5, 1.0),
            crossFadeState:
                _show ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: Duration(seconds: 2)),
      ),
    );
  }
}
