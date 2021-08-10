/*
 * @Author: long_jj
 * @Date: 2021-08-10 14:07:45
 * @LastEditTime: 2021-08-10 16:50:43
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimateMove\AnimateMove.dart
 */

import 'package:flutter/material.dart';

class AnimateMovePage extends StatefulWidget {
  AnimateMovePage({Key? key}) : super(key: key);

  @override
  _AnimateMovePageState createState() => _AnimateMovePageState();
}

class _AnimateMovePageState extends State<AnimateMovePage>
    with TickerProviderStateMixin {
  int num = 0;
  bool flag = false;
  late AnimationController _animationController;
  late AnimationController _acaleController;
  late AnimationController _opacityController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    //第一种方法 计算整个动画全程的时间 为 4+7+8 19秒 停顿一秒 利用 _ScaleController.value 切换多个Tween 实现动画
    // _acaleController =
    //     AnimationController(vsync: this, duration: Duration(seconds: 20));

    //第二种方法 使用延时器 以及 定义durantion 控制动画
    _acaleController = AnimationController(vsync: this);
    _opacityController = AnimationController(vsync: this);
    // _animationController.addListener(() {
    //   if (_animationController.status == AnimationStatus.forward) {
    //     flag = true;
    //   }
    //   if (_animationController.status == AnimationStatus.completed) {
    //     _animationController.reset();
    //   }
    // });
    _acaleController.addListener(() {
      print(_acaleController.value);
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _acaleController.dispose();
    _opacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ++++ ------- ========
    //前4秒
    Animation animaton1 = Tween(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: Interval(0.0, 0.2)))
        .animate(_acaleController);
    //后8秒
    Animation animaton2 = Tween(begin: 1.0, end: 0.0)
        .chain(CurveTween(curve: Interval(0.55, 0.95)))
        .animate(_acaleController);

    //中间 7秒
    Animation animaton3 = Tween(begin: 1.0, end: 0.5)
        .chain(CurveTween(curve: Interval(0.2, 0.55)))
        .animate(_acaleController);

    return Scaffold(
      appBar: AppBar(
        title: Text('练习'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 30,
              child: Row(
                children: [
                  Text("$num"),
                  GestureDetector(
                    onTap: () {
                      _animationController.forward();
                    },
                    child: AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: Tween<double>(begin: 1.0, end: 1.3)
                              .chain(CurveTween(curve: Curves.easeInOut))
                              .evaluate(_animationController),
                          child: Icon(
                            Icons.lens_sharp,
                            color: flag ? Colors.red : null,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            Text('478呼吸法动画'),
            AnimatedBuilder(
              animation: _acaleController,
              builder: (context, child) {
                return FadeTransition(
                  opacity:
                      Tween(begin: 1.0, end: 0.0).animate(_opacityController),
                  child: Container(
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      // borderRadius: BorderRadius.circular(150),
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [
                        Colors.blue.shade500,
                        Colors.blue.shade100,
                      ],
                          //第一种
                          // stops: _acaleController.value <= 0.2
                          //     ? [animaton1.value, animaton1.value + 0.1]
                          //     : [animaton2.value, animaton2.value + 0.1],
                          //第二
                          stops: [
                            _acaleController.value,
                            _acaleController.value + 0.1
                          ]),
                    ),
                  ),
                );
              },
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () async {
                    // _acaleController.repeat();
                    _acaleController.duration = Duration(seconds: 4);
                    _acaleController.forward();
                    await Future.delayed(Duration(seconds: 4));

                    _opacityController.duration = Duration(milliseconds: 1750);
                    _opacityController.repeat(reverse: true);
                    await Future.delayed(Duration(seconds: 7));
                    _opacityController.stop();

                    _acaleController.duration = Duration(seconds: 8);
                    _acaleController.reverse();
                  },
                  child: Text('START'),
                ),
                ElevatedButton(
                  onPressed: () {
                    _acaleController.stop();
                  },
                  child: Text('STOP'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
