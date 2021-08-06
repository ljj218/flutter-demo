/*
 * @Author: long_jj
 * @Date: 2021-08-06 14:12:43
 * @LastEditTime: 2021-08-06 14:46:55
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\AnimatedContainer\AnimatedContainer.dart
 */
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimatedContainerPage> {
  double _height = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text('动画'),
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                this._height += 100;

                if (this._height >= 400) {
                  this._height = 200;
                }
              });
            },
          ),
          body: ListView(
            children: [
              Center(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: 200,
                  height: _height,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Hi',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Divider(),
              Text("AnimatedContainer 动画只能改变自生属性，子组件不附加动画")
            ],
          )),
    );
  }
}
