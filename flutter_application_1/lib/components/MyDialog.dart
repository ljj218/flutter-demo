/*
 * @Author: long_jj
 * @Date: 2021-07-30 15:53:42
 * @LastEditTime: 2021-07-30 17:38:34
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\components\MyDialog.dart
 */
import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, //设置透明度
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Text('sss'),
              )
            ],
          )
        ],
      ),
    );
  }
}
