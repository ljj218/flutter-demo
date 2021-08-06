/*
 * @Author: long_jj
 * @Date: 2021-08-06 16:59:17
 * @LastEditTime: 2021-08-06 17:55:49
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tweenAnimationBuilder\tweenAnimationBuilder.dart
 */

import 'package:flutter/material.dart';

class TweenAnimationBuilderPage extends StatefulWidget {
  TweenAnimationBuilderPage({Key? key}) : super(key: key);

  @override
  _TweenAnimationBuilderPageState createState() =>
      _TweenAnimationBuilderPageState();
}

class _TweenAnimationBuilderPageState extends State<TweenAnimationBuilderPage> {
  double _value = 0.785;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('补间动画-tweenAnimationBuilder'),
      ),
      body: Column(
        children: [
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 20.0, end: 100.0),
            duration: Duration(seconds: 2),
            builder: (context, double value, child) {
              return Container(
                width: 200,
                height: 200,
                color: Colors.amber,
                child: Center(
                  child: Text(
                    'Hi',
                    style: TextStyle(fontSize: value),
                  ),
                ),
              );
            },
            onEnd: () {
              print('动画结束');
            },
          ),
          Divider(),
          Text('tween 设置区间 需要按需求传入类型，否则报错；'),
          Text('builder value 是tween区间变动传过来的值'),
          Text('tween begin可以不设置 程序自动默认end 为初始值'),
          Text('动画开始后 从begin到end 但是变动end的值 ，动画不是从begin再到end,而是 end1 - end2'),
          Divider(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0.0, end: _value),
            duration: Duration(seconds: 2),
            builder: (context, double value, child) {
              return Transform.rotate(
                angle: value,
                // origin: Offset(50, 50),
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Text(
                    'Hi',
                    style: TextStyle(fontSize: 40),
                  ),
                ),
              );
            },
            onEnd: () {
              setState(() {
                _value = _value == 0.785 ? 1.570 : 0.785;
                //度数的计算 是  (3.14/180）*想要的角度
                // (3.14/180)*45 =  0.785
              });
            },
          ),
        ],
      ),
    );
  }
}
