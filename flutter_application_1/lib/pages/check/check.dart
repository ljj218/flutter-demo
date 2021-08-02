/*
 * @Author: long_jj
 * @Date: 2021-07-27 09:04:09
 * @LastEditTime: 2021-07-27 17:46:24
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\check\check.dart
 */
import 'package:flutter/material.dart';

class CheckRadio extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<CheckRadio> {
  bool flag = true; //checkbox

  int sex = 1; //radio

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('checkbox,checkboxListTile , radio ,radioListTile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Checkbox(
                value: this.flag,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    this.flag = value!;
                  });
                },
                activeColor: Colors.yellow,
              ),
              CheckboxListTile(
                value: this.flag,
                title: Text('主标题选'),
                subtitle: Text('副标题选择'),
                selected: this.flag, //选中后文字的样式
                onChanged: (v) {
                  setState(() {
                    this.flag = v!;
                  });
                },
              ),
              Row(
                children: [
                  Text(
                    '男：',
                    style: TextStyle(
                      color: this.sex == 1 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Radio(
                    value: 1,
                    groupValue: this.sex, //分组
                    onChanged: (v) {
                      setState(() {
                        this.sex = v as int;
                      });
                    },
                  ),
                  SizedBox(width: 20),
                  Text(
                    '女：',
                    style: TextStyle(
                      color: this.sex == 2 ? Colors.blue : Colors.black,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: this.sex, //分组
                    activeColor: Colors.red,
                    onChanged: (v) {
                      setState(() {
                        this.sex = v as int;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${this.sex}'),
                  Text(this.sex == 1 ? '男' : '女'),
                ],
              ),
              Divider(),
              RadioListTile(
                value: 1,
                groupValue: this.sex,
                title: Text('我是radio单选1'),
                subtitle: Text('我是radio富文本单选1'),
                secondary: Icon(Icons.hail),
                onChanged: (v) {
                  setState(() {
                    this.sex = v as int;
                  });
                },
              ),
              RadioListTile(
                value: 2,
                groupValue: this.sex,
                title: Text('我是radio单选1'),
                subtitle: Text('我是radio富文本单选1'),
                onChanged: (v) {
                  setState(() {
                    this.sex = v as int;
                  });
                },
              ),
              Divider(),
              Switch(
                value: this.flag,
                onChanged: (v) {
                  setState(() {
                    this.flag = v;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
