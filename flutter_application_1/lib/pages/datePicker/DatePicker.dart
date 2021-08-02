/*
 * @Author: long_jj
 * @Date: 2021-07-29 14:28:20
 * @LastEditTime: 2021-07-29 16:16:17
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\datePicker\DatePicker.dart
 */

import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart'; //引入三方时间格式插件

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class DatePickerPage extends StatefulWidget {
  DatePickerPage({Key? key}) : super(key: key);

  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime nowTime = DateTime.now();

  //获取时间戳
  getTime() {
    var now = DateTime.now();
    // print(now); //2021-07-29 14:47:00.438565
    final time = now.millisecondsSinceEpoch;
    // DateTime.fromMillisecondsSinceEpoch(time);
    return time;
  }

  //展示日期选择器
  _showDatepicker() async {
    var res = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    setState(() {
      this.nowTime = res as DateTime;
    });
  }

  _show() {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime(2019, 6, 7), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      print('confirm $date');
    }, currentTime: DateTime.now(), locale: LocaleType.zh);
  }

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    print(formatDate(now, [yyyy, '年', mm, '月', dd, '日'])); //格式插件 2021年07月29日
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('日期组件展示'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("获取当前时间："),
                Text('DateTime.now()'),
              ],
            ),
            Row(
              children: [
                Text("获取当前时间戳："),
                Text('DateTime.now().millisecondsSinceEpoch'),
                SizedBox(width: 20),
                Text(
                  '${this.getTime()}',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            Row(
              children: [
                Text("时间戳转换日期"),
                Text('DateTime.fromMillisecondsSinceEpoch'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text('${formatDate(this.nowTime, [
                            yyyy,
                            '年',
                            mm,
                            '月',
                            dd,
                            '日'
                          ])}'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  onTap: this._showDatepicker,
                )
              ],
            ),
            SizedBox(height: 20),
            Text('三方插件'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text('${formatDate(this.nowTime, [
                            yyyy,
                            '年',
                            mm,
                            '月',
                            dd,
                            '日'
                          ])}'),
                      Icon(Icons.arrow_drop_down),
                    ],
                  ),
                  onTap: this._show,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
