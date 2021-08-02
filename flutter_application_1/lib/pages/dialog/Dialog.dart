/*
 * @Author: long_jj
 * @Date: 2021-07-30 10:43:42
 * @LastEditTime: 2021-07-30 15:23:44
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\dialog\Dialog.dart
 */
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

class DialogPage extends StatefulWidget {
  DialogPage({Key? key}) : super(key: key);

  @override
  _DialogpageState createState() => _DialogpageState();
}

class _DialogpageState extends State<DialogPage> {
  // _alertDialog() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('提示信息'),
  //         content: Text('确定删除'),
  //         actions: [
  //           TextButton(
  //             child: Text('取消'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //           ElevatedButton(
  //             child: Text('确定'),
  //             onPressed: () {
  //               Navigator.pop(context);
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }
  _alertDialog() async {
    var res = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('提示信息'),
          content: Text('确定删除'),
          actions: [
            TextButton(
              child: Text('取消'),
              onPressed: () {
                Navigator.pop(context, 'cancel');
              },
            ),
            ElevatedButton(
              child: Text('确定'),
              onPressed: () {
                Navigator.pop(context, 'ok');
              },
            ),
          ],
        );
      },
    );
    print(res);
  }

  _simpleDialog() async {
    var res = await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('请选择！'),
            children: [
              SimpleDialogOption(
                child: Text('button A'),
                onPressed: () {
                  print("a");
                  Navigator.pop(context, 'a');
                },
              ),
              SimpleDialogOption(
                child: Text('button B'),
                onPressed: () {
                  // print("B");
                  Navigator.pop(context, 'b');
                },
              ),
              SimpleDialogOption(
                child: Text('button C'),
                onPressed: () {
                  print("C");
                  Navigator.pop(context, 'c');
                },
              ),
            ],
          );
        });
    print(res);
  }

  _showModalbottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 138,
          child: ListView(
            children: [
              ListTile(
                title: Text('sss'),
                onTap: () {
                  print("a");
                  Navigator.pop(context, 'a');
                },
              ),
              Divider(),
              ListTile(
                title: Text('sss'),
                onTap: () {
                  print("C");
                  Navigator.pop(context, 'c');
                },
              ),
              Divider(),
            ],
          ),
        );
      },
    );
  }

  _showToast() {
    Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹窗"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _alertDialog,
              child: Text('alert 弹窗 - AlertDialog'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: _simpleDialog,
              child: Text('select 弹窗 - SimpleDialog'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: _showModalbottomSheet,
              child: Text('ActionSheet 弹窗 showModalBottomSheet'),
            ),
            Divider(),
            ElevatedButton(
              onPressed: _showToast,
              child: Text('toast-flutter 三方'),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
