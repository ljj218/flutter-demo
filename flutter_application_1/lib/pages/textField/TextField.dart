import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TryTextField extends StatefulWidget {
  TryTextField({Key? key}) : super(key: key);

  @override
  _TryTextFieldState createState() => _TryTextFieldState();
}

class _TryTextFieldState extends State<TryTextField> {
  TextEditingController userName = TextEditingController();
  String _userName = '';
  String _password = '';
  GlobalKey _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    userName.text = '初始化名字 TextEditingController';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('表单'),
        ),
        body: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Column(
              children: [
                TextField(),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  inputFormatters: [LengthLimitingTextInputFormatter(6), FilteringTextInputFormatter.digitsOnly],
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
                Container(
                  height: 20,
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_alarm),
                      hintText: '请输入111',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  color: Colors.red,
                  height: 100,
                  child: TextField(
                    controller: userName,
                    decoration: InputDecoration(
                      icon: Icon(Icons.access_alarm),
                      hintText: '初始化名字1',
                      isCollapsed: true,
                    ),
                    onChanged: (value) {
                      // print(value);
                      setState(() {
                        this._userName = value; //输入框改变触发事件
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    icon: Icon(Icons.password),
                    hintText: '密码',
                  ),
                  onChanged: (value) {
                    // print(value);
                    setState(() {
                      this._password = value; //输入框改变触发事件
                    });
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                ElevatedButton(
                  onPressed: () {
                    print('账号：${this._userName} 密码${this._password}');
                  },
                  child: Text('模拟登录'),
                ),
                SizedBox(height: 10),
                Container(
                  height: 40,
                  width: 250,
                  padding: EdgeInsets.all(0),
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      fillColor: Color(0x30cccccc),
                      filled: true,
                      labelStyle: TextStyle(fontSize: 20),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x00FF0000)),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                      hintText: 'QQ号/手机号/邮箱',
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.all(Radius.circular(100))),
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                  color: Colors.red,
                ),
                Row(
                  children: [Text('Form')],
                ),
                Divider(
                  height: 10,
                  color: Colors.red,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formkey, //设置globalKey，用于后面获取FormState
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: '用户名',
                    ),
                    validator: (v) {
                      return v!.trim() == '' ? '不能为空' : null;
                    },
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
