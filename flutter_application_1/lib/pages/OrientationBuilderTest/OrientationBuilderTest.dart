/*
 * @Author: long_jj
 * @Date: 2021-08-24 17:31:08
 * @LastEditTime: 2021-08-24 17:40:00
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\OrientationBuilderTest\OrientationBuilderTest.dart
 */

import 'package:flutter/material.dart';

class OrientationBuilderTestPage extends StatelessWidget {
  const OrientationBuilderTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('OrientationBuilderTest'),
        ),
        body: Center(
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Flex(
                direction: orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < 100; i++)
                    Container(
                      key: UniqueKey(),
                      width: 50,
                      height: 50,
                      color: Colors.primaries[i % 9][300],
                    )
                ],
              );
            },
          ),
        ));
  }
}
