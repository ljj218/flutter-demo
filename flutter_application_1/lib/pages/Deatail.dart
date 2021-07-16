import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  String arguments;

  Detail({this.arguments = '我是详情页面'});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.arguments),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
      ),
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: 400,
              height: 400,
              color: Colors.red,
            ),
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                child: Text('我是定位'),
                width: 60,
                height: 60,
                color: Colors.white,
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Map mp = {"aa": 1};
                  // Navigator.pop(context, mp);
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Tabs(index: 1)),
                      (route) => false);
                },
                child: Text('pop返回'))
          ],
        ),
      ),
    );
  }
}
