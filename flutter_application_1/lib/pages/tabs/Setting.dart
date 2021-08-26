/*
 * @Author: Long_jj
 * @Date: 2021-07-20 09:58:34
 * @LastEditTime: 2021-08-25 17:32:21
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabs\Setting.dart
 */
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> list = List.filled(20, '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'images/animate.png',
          fit: BoxFit.contain,
        ),
        Expanded(
          flex: 1,
          // child: ListView(children: this.CreateList()),
          child: ListView(
            children: [
              ListTile(
                title: Text('尺寸限制类容器'),
                subtitle: Text('用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素'),
                onTap: () {
                  Navigator.pushNamed(context, '/FlexBoxPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('动画'),
                subtitle: Text('AnimatedContainer - 盒子自身属性变化动画'),
                onTap: () {
                  Navigator.pushNamed(context, '/AnimatedContainerPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('动画'),
                subtitle: Text('AnimatedSwitcher - 子组件切换过度动画'),
                onTap: () {
                  Navigator.pushNamed(context, '/AnimatedSwitcherPage');
                },
              ),
              Divider(),
              InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/Hero1Demo');
                  },
                  child: Hero(
                    tag: 'hero',
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          'https://sdxcomm.oss-cn-beijing.aliyuncs.com/images/banner/20201125/65f0e0c182db4029bd16dae10b0388bf.jpg'),
                    ),
                  )),
              Text(
                  'hero - 当用户点击一张动画切换页面，在另一个页面也存在这个动画使用hero组件最合适； timeDilation 延时动画'),
              Divider(),
              ListTile(
                title: Text('更多的动画控件和曲线-curve'),
                subtitle: Text(
                    'AnimatedOpacity - 透明度过度动画  和AnimatedContainer 类似,有个Opacity属性; AnimatedPadding'),
                onTap: () {
                  Navigator.pushNamed(context, '/MoreAnimatedPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('补间动画-TweenAnimationBuilder'),
                subtitle: Text(
                    'TweenAnimationBuilder - 在设置的Tween的begin和end之前变动，形成动画;另外介绍了Transiform组件'),
                onTap: () {
                  Navigator.pushNamed(context, '/TweenAnimationBuilderPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('旋转动画-RotationTransiton'),
                subtitle: Text(
                    'TweenAnimationBuilder - 在设置的Tween的begin和end之前变动，形成动画;另外介绍了Transiform组件'),
                onTap: () {
                  Navigator.pushNamed(context, '/RotationTransitonPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('交错动画-- 管理区间和曲线'),
                subtitle: Text(
                    '利用区间曲线 Tween-chain-CurveTween -Interval 在固定的时间内运行设置的Tween的begin和end之前变动，形成动画;另外介绍了WillPopScope组件'),
                onTap: () {
                  Navigator.pushNamed(context, '/StaggeredAnimationPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('构建动画-自定义动画 -AnimatedBuilder'),
                subtitle: Text(
                    '利用区间曲线 Tween-chain-CurveTween -Interval 在固定的时间内运行设置的Tween的begin和end之前变动，形成动画;另外介绍了WillPopScope组件'),
                onTap: () {
                  Navigator.pushNamed(context, '/AnimatedBuilderPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('自定义画笔 -customPaint'),
                subtitle: Text('...'),
                onTap: () {
                  Navigator.pushNamed(context, '/CustomPaintPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('拖拽排序游戏教程 '),
                subtitle: Text('按照颜色深浅拖拽进行排序的小游戏'),
                onTap: () {
                  Navigator.pushNamed(context, '/DragTheSortingPage');
                },
              ),
              Divider(),
              ListTile(
                title: Text('学习拖拽排序游戏 '),
                subtitle: Text('按照颜色深浅拖拽进行排序的小游戏'),
                onTap: () {
                  Navigator.pushNamed(context, '/MyDragSortingPage');
                },
              ),
              SizedBox(height: 50),
              ElevatedButton(
                // style: ButtonStyle(

                // ),
                style: ElevatedButton.styleFrom(),
                onPressed: () {
                  Navigator.pushNamed(context, '/AnimateMovePage');
                },
                child: Text('动画效果练习'),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text('动画的理解'),
                    Text(
                        '主要通过控制器来控制动画的开始，结束，往复，监听进程，Animation用来添加动画的状态-贝塞尔曲线，Animation需要挂在controll上'),
                    Text(
                        'Animation<double> angleAnimation = new Tween(begin: 0.0, end: pi/2).animate(    new CurvedAnimation('),
                    Text('parent: _controller,'),
                    Text('curve:  Curves.ease,'),
                    Text('reverseCurve: Curves.easeOut,'),
                    Text('));'),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
//AnimationController _controller
// Animation<double> angleAnimation = new Tween(begin: 0.0, end: pi/2).animate(    new CurvedAnimation(
//         parent: _controller,
//         curve:  Curves.ease,
//         reverseCurve: Curves.easeOut
//     ));


// Animation<Offset>
//  AnimationController;
// Tween(begin: Offset.zero, end: Offset(0.1, 0)).chain(CurveTween(curve: Interval(0.8, 1.0))).animate(AnimationController)


// 序列 前50% 1.0-1.3 后50% 1.3-1.0
//_iconAnimation = TweenSequence([
//    TweenSequenceItem(
//        tween: Tween(begin: 1.0, end: 1.3)
//            .chain(CurveTween(curve: Curves.easeIn)),
//        weight: 50),
//    TweenSequenceItem(tween: Tween(begin: 1.3, end: 1.0), weight: 50),
//  ]).animate(_animationController);


//变化颜色 时间是 0-0.5 前半段 变换尺寸 0.5-1.0 
//  _colorAnimation = ColorTween(begin: Colors.red, end: Colors.blue).animate(
//         CurvedAnimation(
//             parent: _animationController, curve: Interval(0.0, 0.5)));

//     _sizeAnimation = Tween(begin: 100.0, end: 300.0).animate(CurvedAnimation(
//         parent: _animationController, curve: Interval(0.5, 1.0)));


//，动画时长为6秒，前40%的时间大小从100->200，然后保持200不变20%的时间，最后40%的时间大小从200->300，这种效果通过TweenSequence实现，代码如下：
// _animation = TweenSequence([
//   TweenSequenceItem(
//       tween: Tween(begin: 100.0, end: 200.0)
//           .chain(CurveTween(curve: Curves.easeIn)),
//       weight: 40),
//   TweenSequenceItem(tween: ConstantTween<double>(200.0), weight: 20),
//   TweenSequenceItem(tween: Tween(begin: 200.0, end: 300.0), weight: 40),
// ]).animate(_animationController);