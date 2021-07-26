import 'package:flutter/material.dart';

import 'Home.dart';
import 'News.dart';
import 'Setting.dart';

class Tabs extends StatefulWidget {
  final index;
  Tabs({Key? key, this.index = 0}) : super(key: key);

  @override
  _TabsePageState createState() => _TabsePageState(index);
}

class _TabsePageState extends State<Tabs> {
  int _currentIndex = 0;
  _TabsePageState(index) {
    this._currentIndex = index;
  }

  List<Widget> list = [HomePage(), NewsPage(), SettingPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "模块化开发",
          textAlign: TextAlign.center,
        ),
      ),
      body: this.list[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_label),
            activeIcon: Icon(
              Icons.new_label,
              color: Colors.blue,
            ),
            label: '新闻',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            label: '设置',
          ),
        ],
        currentIndex: this._currentIndex,
        onTap: (e) {
          setState(() {
            this._currentIndex = e;
          });
        },
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            DrawerHeader(
                child: Container(
              child: Text('侧边Head'),
            )),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('侧边栏1'),
              onTap: () {
                Navigator.of(context).pop();
                print("object");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('侧边栏2'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('侧边栏3'),
            ),
          ],
        ),
      ),
    );
  }
}
