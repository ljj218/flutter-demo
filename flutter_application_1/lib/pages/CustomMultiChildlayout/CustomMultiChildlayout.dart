/*
 * @Author: long_jj
 * @Date: 2021-08-24 11:30:34
 * @LastEditTime: 2021-08-24 14:45:00
 * @LastEditors: long_jj
 * @Description: 自定义 组件 布局
 * @FilePath: \flutter_application_1\lib\pages\CustomMultiChildlayout\CustomMultiChildlayout.dart
 */

import 'package:flutter/material.dart';

class CustomMultiChildlayoutPage extends StatefulWidget {
  CustomMultiChildlayoutPage({Key? key}) : super(key: key);

  @override
  _CustomMultiChildlayoutPageState createState() =>
      _CustomMultiChildlayoutPageState();
}

class _CustomMultiChildlayoutPageState
    extends State<CustomMultiChildlayoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CustomMultiChildlayout'),
      ),
      body: CustomMultiChildLayout(
        delegate: MyDelegte(),
        children: [
          LayoutId(
              id: 2,
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
              )),
          LayoutId(
              id: 1,
              child: Text(
                '下划线',
                style: TextStyle(fontSize: 30),
              )),
        ],
      ),
    );
  }
}

class MyDelegte extends MultiChildLayoutDelegate {
  late double left;
  late double top;
  late final size1, size2;
  @override
  void performLayout(Size size) {
    print(size); //可用宽高

    size1 = layoutChild(1, BoxConstraints.loose(size));
    left = (size.width - size1.width) / 2;
    positionChild(1, Offset(left, 0));

    size2 = layoutChild(
      2,
      BoxConstraints(
        maxWidth: size1.width,
        maxHeight: 4,
        minHeight: 4,
        minWidth: size1.width,
      ),
    );
    positionChild(2, Offset(left, size1.height));
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => true;
}
