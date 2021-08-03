/*
 * @Author: long_jj
 * @Date: 2021-07-27 09:04:09
 * @LastEditTime: 2021-08-03 22:16:01
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/tabs/Home.dart
 */
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        child: OutlinedButton(
          child: Text('跳转到详情页面'),
          onPressed: () => {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => Detail(
            //             title: '详情页传值',
            //           )),
            // )
            Navigator.pushNamed(context, '/Detail', arguments: 'arguments ssssssewee21').then((value) => print(value))
          },
        ),
      ),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/TabBarPage');
        },
        child: Text('跳转到TabBar自定义页面-覆盖APPBAR'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/TabBarControllerPage');
        },
        child: Text('_tabBarController'),
      ),
      OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/TryTextField');
        },
        child: Text('表单输入'),
      ),
      Divider(),
      OutlinedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CheckRadio');
        },
        child: Text('CheckRadio'),
      ),
      SizedBox(height: 10),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/DatePickerPage');
        },
        child: Text('日期组件'),
      ),
      InkWell(
        child: Column(
          children: [
            Image.network(
              'https://sdxcomm.oss-cn-beijing.aliyuncs.com/images/banner/20201125/65f0e0c182db4029bd16dae10b0388bf.jpg',
              fit: BoxFit.cover,
            ),
            Text('弹窗')
          ],
        ),
        onTap: () {
          Navigator.pushNamed(context, '/DialogPage');
        },
      ),
      Divider(),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CustomDialogPage');
        },
        child: Text('自定义组件-customDialog'),
      ),
      Divider(),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/CustomScrollView');
        },
        child: Text('自定义滚动组件-customScrollView -physics'),
      ),
      SizedBox(height: 20),
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/RefreshPage');
        },
        child: Text('下拉刷新'),
      ),
      SizedBox(height: 30)
    ]);
  }
}
