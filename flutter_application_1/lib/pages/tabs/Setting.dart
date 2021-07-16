import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
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
          child: ListView(children: this.CreateList()),
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  List<Widget> CreateList() {
    List<Widget> list = List.generate(
      20,
      (index) => ListTile(
        title: Text('测试页面含有底部navbar是否正常'),
      ),
    );
    return list;
  }
}
