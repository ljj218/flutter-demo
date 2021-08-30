/*
 * @Author: long_jj
 * @Date: 2021-08-24 15:40:39
 * @LastEditTime: 2021-08-24 17:16:28
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\RenderObject\RenderObject.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// class RenderObject extends StatefulWidget {
//   RenderObject({Key? key}) : super(key: key);
//
//   @override
//   _RenderObjectState createState() => _RenderObjectState();
// }
//
// class _RenderObjectState extends State<RenderObject> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RenderObject '),
//       ),
//       body: MyRenderBox(child: FlutterLogo()),
//     );
//   }
// }
//
// class MyRenderBox extends SingleChildRenderObjectWidget {
//   MyRenderBox({Widget? child}) : super(child: child);
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//     return RenderMyRenderBox();
//   }
// }
//
// class RenderMyRenderBox extends RenderBox with RenderObjectWithChildMixin {
//   @override
//   void performLayout() {
//     child.layout(constraints, parentUsesSize: true);
//     size = (child as RenderBox).size;
//   }
//
//   @override
//   void paint(PaintingContext context, Offset offset) {
//     context.paintChild(child!, offset);
//   }
// }
