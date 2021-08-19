/*
 * @Author: long_jj
 * @Date: 2021-08-18 15:48:07
 * @LastEditTime: 2021-08-18 16:51:17
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\streamBuilder\StreamBuilder.dart
 */

import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderPage extends StatefulWidget {
  StreamBuilderPage({Key? key}) : super(key: key);

  @override
  _StreamBuilderPageState createState() => _StreamBuilderPageState();
}

class _StreamBuilderPageState extends State<StreamBuilderPage> {
  //broadcast 广播 多个监听 initState 和  streamBuilder 里的 stream 两个监听
  // 广播数据不会有缓存
  // 相反 非广播 数据会缓存
  // StreamController controller = StreamController.broadcast();
  StreamController controller = StreamController();

  @override
  void initState() {
    // Future.delayed(Duration(seconds: 5), () {
    //   controller.stream.listen((event) {
    //     print('event = $event');
    //   });
    // });
    controller.stream.listen(
      (event) {
        print('event = $event');
      },
      onDone: () => print('done '),
      onError: (err) => print('err $err'),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamBuilder'),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              controller.sink.add('hi');
            },
            child: Text('Hi'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.sink.addError('opps');
            },
            child: Text('addError - opps'),
          ),
          ElevatedButton(
            onPressed: () {
              controller.sink.close();
            },
            child: Text('close'),
          ),
          StreamBuilder(
            stream: controller.stream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Text('None : 没有数据');
                case ConnectionState.waiting:
                  return Text('waiting : 等待数据！~');
                case ConnectionState.active:
                  if (snapshot.hasError) {
                    return Text('active :${snapshot.error}');
                  } else {
                    return Text('active : ${snapshot.data}');
                  }
                case ConnectionState.done:
                  return Text('waiting : 数据已经结束！~');
              }
            },
          )
        ],
      ),
    );
  }
}
