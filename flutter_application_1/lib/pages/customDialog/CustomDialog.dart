/*
 * @Author: long_jj
 * @Date: 2021-07-30 15:46:44
 * @LastEditTime: 2021-07-30 15:58:12
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\customDialog\CustomDialog.dart
 */
import 'package:flutter/material.dart';

import '../../components/MyDialog.dart';

class CustomDialogPage extends StatefulWidget {
  CustomDialogPage({Key? key}) : super(key: key);

  @override
  _CustomDialogPageState createState() => _CustomDialogPageState();
}

class _CustomDialogPageState extends State<CustomDialogPage> {
  _showCustomDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义弹窗'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _showCustomDialog,
              child: Text('自定义弹窗-customDialog'),
            ),
          ],
        ),
      ),
    );
  }
}
