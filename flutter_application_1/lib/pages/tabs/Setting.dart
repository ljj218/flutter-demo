/*
 * @Author: Long_jj
 * @Date: 2021-07-20 09:58:34
 * @LastEditTime: 2021-08-10 14:26:02
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
              SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/AnimateMovePage');
                  },
                  child: Text('动画效果练习'))
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  // List<Widget> CreateList() {
  //   List<Widget> list = List.generate(
  //     20,
  //     (index) => ListTile(
  //       title: Text('测试页面含有底部navbar是否正常'),
  //       onTap: () {},
  //     ),
  //   );
  //   return list;
  // }
}
