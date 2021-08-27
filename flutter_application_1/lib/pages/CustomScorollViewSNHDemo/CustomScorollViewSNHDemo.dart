import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// https://h5.48.cn/resource/jsonp/allmembers.php?gid=00&callback=get_members_success&_=1629985910907

class CustomScorollViewSNHDemo extends StatefulWidget {
  const CustomScorollViewSNHDemo({Key? key}) : super(key: key);

  @override
  _CustomScorollViewSNHDemoState createState() => _CustomScorollViewSNHDemoState();
}

class _CustomScorollViewSNHDemoState extends State<CustomScorollViewSNHDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar()
      ],
    );
  }
}
