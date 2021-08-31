/*
 * @Author: long_jj
 * @Date: 2021-08-24 17:21:40
 * @LastEditTime: 2021-08-30 15:51:42
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabs\prictic.dart
 */
import 'package:flutter/material.dart';

import '../waterMark/waterMark.dart';

class Prictic extends StatelessWidget {
  const Prictic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text('适配屏幕方向'),
            subtitle: Text('利用 OrientationBuilder'),
            onTap: () {
              Navigator.pushNamed(context, '/OrientationBuilderTestPage');
            },
          ),
          Text(
            '文字镂空ABC-消耗性能',
            style: TextStyle(fontSize: 30.0, color: Colors.white, shadows: [
              Shadow(
                color: Colors.red,
                offset: Offset(0.0, 2.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(2.0, 0.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(0.0, -2.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(-2.0, 0.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(-2.0, -2.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(-2.0, 2.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(2.0, 2.0),
              ),
              Shadow(
                color: Colors.red,
                offset: Offset(2.0, 0.0),
              ),
            ]),
          ),
          Divider(),
          WaterMarkDemo(
            child: Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlutterLogo(
                    size: 100,
                  ),
                  Text('Flutter')
                ],
              ),
            ),
            watermark: "觉觉觉觉觉",
          ),
          ListTile(
            title: Text('sliver滚动模式练习'),
            subtitle: Text('利用 CustomScorollView'),
            onTap: () {
              Navigator.pushNamed(context, '/CustomScorollViewSNHDemoPage');
            },
          )
        ],
      ),
    );
  }
}
