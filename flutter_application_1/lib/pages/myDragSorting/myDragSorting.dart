/*
 * @Author: long_jj
 * @Date: 2021-08-12 14:29:20
 * @LastEditTime: 2021-08-13 11:21:37
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\myDragSorting\myDragSorting.dart
 */
import 'dart:math';
import 'package:flutter/material.dart';

class MyDragSortingPage extends StatefulWidget {
  MyDragSortingPage({Key? key}) : super(key: key);

  @override
  _MyDragSortingPageState createState() => _MyDragSortingPageState();
}

class _MyDragSortingPageState extends State<MyDragSortingPage> {
  // ignore: unused_field
  late Color _color = Colors.blue.shade100;
  late List<Color> _colors = [];
  GlobalKey _key = GlobalKey();
  late int startIndex;
  late int endIndex;
  late int _slot; //拖动的元素序号
  _shuffle() {
    int r = Random().nextInt(255);
    int g = Random().nextInt(255);
    int b = Random().nextInt(255);
    setState(() {
      _color = Color.fromRGBO(r, g, b, 1.0);
      _colors = List.generate(6,
          (index) => Color.fromARGB((255 / 7).ceil() * (index + 1), r, g, b));
      _colors.shuffle();
    });
  }

  @override
  void initState() {
    super.initState();
    _shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('学习拖拽排序动画'),
      ),
      // body: ReorderableListView(
      //     onReorder: (oldIndex, newIndex) {
      //       if (oldIndex < newIndex) {
      //         newIndex -= 1;
      //       }
      //       setState(() {
      //         Color a = _colors.removeAt(oldIndex);
      //         _colors.insert(newIndex, a);
      //       });
      //     },
      //     children: List.generate(
      //       8,
      //       (index) => Box(
      //         key: ValueKey(index),
      //         color: _colors[index],
      //       ),
      //     )),
      body: Listener(
        onPointerDown: (e) {
          // startIndex = (e.position.dx / 54).floor();
        },
        onPointerMove: (e) {
          // print(e.position.dx);
          double x = e.position.dx;
          //第二 //互换
          if (x > (_slot + 1) * Box.width) {
            if (_slot >= _colors.length - 1) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot + 1];
              _colors[_slot + 1] = c;
              _slot++;
            });
          } else if (x < _slot * Box.width) {
            if (_slot == 0) return;
            setState(() {
              final c = _colors[_slot];
              _colors[_slot] = _colors[_slot - 1];
              _colors[_slot - 1] = c;
              _slot--;
            });
          }
        },
        onPointerUp: (e) {
          // endIndex = (e.position.dx / 54).floor();
          // if (endIndex < 0) {
          //   endIndex = 0;
          // } else if (endIndex > 5) {
          //   endIndex = 5;
          // }
          // if (endIndex == startIndex) return;
          // setState(() {
          //   Color a = _colors[startIndex];
          //   _colors[startIndex] = _colors[endIndex];
          //   _colors[endIndex] = a;
          //   // _colors.insert(endIndex - 1, a);
          // });
        },
        child: Stack(
          key: _key,
          children: List.generate(
            6,
            (index) => Box(
                key: ValueKey(_colors[index]),
                color: _colors[index],
                left: (Box.width * index),
                onDrag: (color) {
                  int num = _colors.indexOf(color);
                  _slot = num;

                  // print(num);
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffle,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class Box extends StatelessWidget {
  static const width = 50.0;
  static const height = 150.0;
  static const margin = 2.0;
  Color color;
  double left;
  Function onDrag;
  Box({
    required Key key,
    required this.color,
    required this.left,
    required this.onDrag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final container = Container(
      width: width - (margin * 2),
      height: height,
      color: color,
    );
    return AnimatedPositioned(
        duration: Duration(milliseconds: 100),
        top: 0,
        left: left,
        child: Draggable(
          onDragStarted: () => onDrag(color),
          child: container,
          feedback: container,
          childWhenDragging: Opacity(opacity: 0, child: container),
        ));
  }
}
