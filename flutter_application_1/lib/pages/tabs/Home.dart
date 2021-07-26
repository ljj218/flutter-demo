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
    return Column(children: [
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
        child: Text('跳转到TabBar自定义页面'),
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
    ]);
  }
}
