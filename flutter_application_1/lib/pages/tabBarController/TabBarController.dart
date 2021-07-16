import 'package:flutter/material.dart';

class TabBarControllerPage extends StatefulWidget {
  TabBarControllerPage({Key? key}) : super(key: key);

  @override
  _TabBarControllerPageState createState() => _TabBarControllerPageState();
}

class _TabBarControllerPageState extends State<TabBarControllerPage>
    with SingleTickerProviderStateMixin {
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
    // TODO: implement dispose
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
