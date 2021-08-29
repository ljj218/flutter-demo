/*
 * @Author: long_jj
 * @Date: 2021-08-24 17:21:40
 * @LastEditTime: 2021-08-24 17:35:33
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabs\prictic.dart
 */
import 'package:flutter/material.dart';

class Prictic extends StatelessWidget {
  const Prictic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text('适配屏幕方向'),
          subtitle: Text('利用 OrientationBuilder'),
          onTap: () {
            Navigator.pushNamed(context, '/OrientationBuilderTestPage');
          },
        ),
        ListTile(
          title: Text('sliver滚动模式练习'),
          subtitle: Text('利用 CustomScorollView'),
          onTap: () {
            Navigator.pushNamed(context, '/CustomScorollViewSNHDemoPage');
          },
        )
      ],
    );
  }
}
