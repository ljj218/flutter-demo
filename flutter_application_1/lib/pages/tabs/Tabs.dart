/*
 * @Author: long_jj
 * @Date: 2021-07-13 17:29:50
 * @LastEditTime: 2021-08-24 17:27:17
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\tabs\Tabs.dart
 */
import 'package:flutter/material.dart';

import 'Home.dart';
import 'News.dart';
import 'Setting.dart';
import 'prictic.dart';

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

  List<Widget> list = [HomePage(), NewsPage(), SettingPage(), Prictic()];
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
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.compare),
            activeIcon: Icon(
              Icons.compare,
              color: Colors.blue,
            ),
            label: '基础组件',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            activeIcon: Icon(
              Icons.check_box,
              color: Colors.blue,
            ),
            label: '新闻',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            activeIcon: Icon(
              Icons.camera,
              color: Colors.blue,
            ),
            label: '动画',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            activeIcon: Icon(
              Icons.camera,
              color: Colors.blue,
            ),
            label: '趣味组件',
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
