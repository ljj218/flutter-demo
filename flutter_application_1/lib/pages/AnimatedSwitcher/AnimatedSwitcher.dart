/*
 * @Author: long_jj
 * @Date: 2021-08-06 14:42:51
 * @LastEditTime: 2021-08-09 21:16:14
 * @LastEditors: Long_jj
 * @Description: 
 * @FilePath: /flutter_application_1/lib/pages/AnimatedSwitcher/AnimatedSwitcher.dart
 */
import 'package:flutter/material.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  AnimatedSwitcherPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimatedSwitcherPage> {
  bool _flag = true;

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
                this._flag = !this._flag;
              });
            },
          ),
          body: ListView(
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: AnimatedSwitcher(
                    // transitionBuilder 自定义切换的效果
                    transitionBuilder: (child, animation) {
                      // print(child.toString());
                      // child 子组件
                      return FadeTransition(
                        opacity: animation,
                        child: ScaleTransition(
                          scale: animation,
                          child: child,
                        ),
                      );
                    },
                    duration: Duration(milliseconds: 500),
                    child: _flag
                        ? Image.network(
                            'https://sdxcomm.oss-cn-beijing.aliyuncs.com/images/banner/20201125/65f0e0c182db4029bd16dae10b0388bf.jpg')
                        : Text(
                            'Hi',
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                  ),
                ),
              ),
              Divider(),
              Text("AnimatedSwicher 监听子组件的变化 添加过度动画 也可以通过key valuekey() 方法生成独一的key"),
              Text('transitionBuilder 函数 自定义切换的效果 ，可以嵌套不同效果')
            ],
          )),
    );
  }
}
