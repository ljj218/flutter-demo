/*
 * @Author: long_jj
 * @Date: 2021-08-06 15:58:30
 * @LastEditTime: 2021-08-06 16:31:29
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\moreAnimated\moreAnimated.dart
 */

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class MoreAnimatedPage extends StatefulWidget {
  MoreAnimatedPage({Key? key}) : super(key: key);

  @override
  _MoreAnimatedState createState() => _MoreAnimatedState();
}

class _MoreAnimatedState extends State<MoreAnimatedPage> {
  double _opacity = 1.0;
  double _padding = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          AnimatedOpacity(
            opacity: _opacity,
            duration: Duration(seconds: 2),
            curve: Curves.bounceInOut, //曲线动画 贝塞尔曲线
            onEnd: () {
              print('动画结束');
            },
            child: Container(
              width: 100,
              height: 100,
              color: Colors.amberAccent,
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                this._opacity = this._opacity == 1.0 ? 0.0 : 1.0;
              });
            },
            child: Text('变成透明'),
          ),
          SizedBox(height: 20),
          Divider(),
          AnimatedPadding(
            padding: EdgeInsets.all(_padding),
            duration: Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 10,
                    offset: Offset(10, 10),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                this._padding = _padding >= 40 ? 10 : 40;
              });
            },
            child: Text('点击切换pading值'),
          ),
          SizedBox(height: 20),
          Divider(),
        ],
      ),
    );
  }
}
