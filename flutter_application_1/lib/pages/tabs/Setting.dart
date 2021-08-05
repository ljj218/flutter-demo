/*
 * @Author: Long_jj
 * @Date: 2021-07-20 09:58:34
 * @LastEditTime: 2021-08-05 21:53:53
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/tabs/Setting.dart
 */
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  List<String> list = List.filled(20, '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: 60,
          color: Colors.red,
          child: Text('sddd'),
        ),
        Container(
          height: 500,
          // child: ListView(children: this.CreateList()),
          child: ListView(
            children: [
              ListTile(
                title: Text('尺寸限制类容器'),
                subtitle: Text('用于对子组件添加额外的约束。例如，如果你想让子组件的最小高度是80像素'),
                onTap: () {
                  Navigator.pushNamed(context, '/FlexBoxPage');
                },
              )
            ],
          ),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  // List<Widget> CreateList() {
  //   List<Widget> list = List.generate(
  //     20,
  //     (index) => ListTile(
  //       title: Text('测试页面含有底部navbar是否正常'),
  //       onTap: () {},
  //     ),
  //   );
  //   return list;
  // }
}
