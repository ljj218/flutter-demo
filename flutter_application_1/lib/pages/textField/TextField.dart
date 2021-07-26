import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TryTextField extends StatefulWidget {
  TryTextField({Key? key}) : super(key: key);

  @override
  _TryTextFieldState createState() => _TryTextFieldState();
}

class _TryTextFieldState extends State<TryTextField> {
  TextEditingController userName = TextEditingController();

  @override
  void initState() {
    super.initState();
    userName.text = '初始化名字 TextEditingController';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('表单'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              TextField(),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                inputFormatters: [
                  LengthLimitingTextInputFormatter(6),
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: '请输入数字账号限制6',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                maxLength: 6,
                decoration: InputDecoration(
                  hintText: '请输入账号限制6',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: '展示4行文字',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '密码输入 obscureText',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: '用户名',
                  labelStyle: TextStyle(color: Colors.red),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.access_alarm),
                  hintText: '请输入',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: userName,
                decoration: InputDecoration(
                  icon: Icon(Icons.access_alarm),
                  hintText: '初始化名字',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
