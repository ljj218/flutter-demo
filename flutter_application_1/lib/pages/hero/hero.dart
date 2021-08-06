/*
 * @Author: long_jj
 * @Date: 2021-08-06 15:17:26
 * @LastEditTime: 2021-08-06 15:39:18
 * @LastEditors: long_jj
 * @Description:   需要两边配置tag 作为统一标识
 * @FilePath: \flutter_application_1\lib\pages\hero\hero.dart
 */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class Hero1Demo extends StatefulWidget {
  Hero1Demo({Key? key}) : super(key: key);

  @override
  _NameStatePage createState() => _NameStatePage();
}

class _NameStatePage extends State<Hero1Demo> {
  @override
  void initState() {
    super.initState();
    timeDilation = 5.0; //延时动画
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: 'hero',
            child: Container(
                child: Image.network(
                    'https://sdxcomm.oss-cn-beijing.aliyuncs.com/images/banner/20201125/65f0e0c182db4029bd16dae10b0388bf.jpg')),
          )),
    );
  }
}
