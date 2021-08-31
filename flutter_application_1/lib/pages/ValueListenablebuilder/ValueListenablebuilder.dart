/*
 * @Author: long_jj
 * @Date: 2021-08-23 15:23:46
 * @LastEditTime: 2021-08-30 15:52:22
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\ValueListenablebuilder\ValueListenablebuilder.dart
 http://redirector.gvt1.com/edgedl/android/studio/ide-zips/2020.3.1.23/android-studio-2020.3.1.23-mac_arm.zip
 */

import 'package:flutter/material.dart';

class ValueListenablebuilderPage extends StatefulWidget {
  ValueListenablebuilderPage({Key? key}) : super(key: key);

  @override
  _ValueListenablebuilderPageState createState() =>
      _ValueListenablebuilderPageState();
}

class _ValueListenablebuilderPageState
    extends State<ValueListenablebuilderPage> {
  //初始化 更新后进行比较 新旧值 然后内部调用 notifyListeners
  late ValueNotifier<int> count = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    print('build -refash');
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('ValueListenableBuilder'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    count.value++;
                  },
                  child: Icon(Icons.add)),
              SizedBox(width: 10),
              ValueListenableBuilder<int>(
                builder: (BuildContext context, int value, Widget? child) {
                  print('build -ValueListenableBuilder');
                  return Text('${count.value}');
                },
                valueListenable: count,
              ),
              SizedBox(width: 10),
              ElevatedButton(
                  onPressed: () {
                    count.value--;
                  },
                  child: Icon(Icons.subscript)),
            ],
          ),
        ),
      ),
    );
  }
}
