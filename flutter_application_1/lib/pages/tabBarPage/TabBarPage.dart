/*
 * @Author: Long_jj
 * @Date: 2021-07-20 09:58:34
 * @LastEditTime: 2021-08-03 22:14:51
 * @LastEditors: Long_jj
 * @Description: appbar 变成tabbar 切换
 * @FilePath: /flutter_application_1/lib/pages/tabBarPage/TabBarPage.dart
 */
import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.addListener(() {
      print(_tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      text: '热门',
                    ),
                    Tab(
                      text: '推荐',
                    ),
                  ],
                ),
              )
            ],
          ),
          centerTitle: true,
          // bottom: TabBar(
          //   tabs: <Widget>[
          //     Tab(
          //       text: '热门',
          //     ),
          //     Tab(
          //       text: '推荐',
          //     ),
          //   ],
          // ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: [
                ListTile(
                  title: Text('我第一个TAB'),
                ),
                ListTile(
                  title: Text('我第一个TAB'),
                ),
                ListTile(
                  title: Text('我第一个TAB'),
                ),
                ListTile(
                  title: Text('我第一个TAB'),
                ),
                ListTile(
                  title: Text('我第一个TAB'),
                )
              ],
            ),
            ListView(
              children: [
                ListTile(
                  title: Text('我第2个TAB'),
                ),
                ListTile(
                  title: Text('我第2个TAB'),
                ),
                ListTile(
                  title: Text('我第2个TAB'),
                ),
                ListTile(
                  title: Text('我第2个TAB'),
                ),
                ListTile(
                  title: Text('我第2个TAB'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
