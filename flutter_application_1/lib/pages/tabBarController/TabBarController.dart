/*
 * @Author: long_jj
 * @Date: 2021-07-16 14:45:30
 * @LastEditTime: 2021-08-02 14:06:59
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabBarController\TabBarController.dart
 */
import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key? key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  //生命周期函数
  void initState() {
    super.initState();
    _tabController = new TabController(
      vsync: this,
      length: 2,
    );
    //配置tabBarController优势 可以监听事件
    _tabController.addListener(() {
      print(_tabController.toString());
      print(_tabController.index);
    });
  }

  @override
  //生命周期
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('_tabController'),
          bottom: TabBar(
            controller: this._tabController,
            tabs: <Widget>[
              Tab(
                text: '测试1',
              ),
              Tab(
                text: '测试2',
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: this._tabController,
          children: [
            Text('测试1'),
            Text('测试2'),
          ],
        ),
      ),
    );
  }
}
