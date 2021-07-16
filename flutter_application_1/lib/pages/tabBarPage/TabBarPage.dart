import 'package:flutter/material.dart';

class TabBarPage extends StatefulWidget {
  TabBarPage({Key? key}) : super(key: key);

  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> {
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
