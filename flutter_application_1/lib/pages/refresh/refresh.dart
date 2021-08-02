import 'package:flutter/material.dart';

class RefreshPage extends StatefulWidget {
  RefreshPage({Key? key}) : super(key: key);

  @override
  _RefreshPageState createState() => _RefreshPageState();
}

class _RefreshPageState extends State<RefreshPage> {
  ScrollController _scorollControler = new ScrollController();

  @override
  void initState() {
    super.initState();
    _scorollControler.addListener(() {
      print(_scorollControler.position.pixels); //滚动条的下啦距离
      print(_scorollControler.position.maxScrollExtent); //整个页面高度
    });
  }

  Future<void> _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 2000), () {
      print("刷新结束");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('下拉刷新'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: ListView.builder(
          controller: _scorollControler,
          itemCount: 30,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('$index 新闻'),
            );
          },
        ),
      ),
    );
  }
}
