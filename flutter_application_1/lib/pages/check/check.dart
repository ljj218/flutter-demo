import 'package:flutter/material.dart';

class CheckRadio extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<CheckRadio> {
  bool flag = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('checkbox,checkboxListTile , radio ,radioListTile'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Checkbox(
                value: this.flag,
                onChanged: (value) {
                  print(value);
                  setState(() {
                    this.flag = value!;
                  });
                },
                activeColor: Colors.yellow,
              ),
              CheckboxListTile(
                  value: this.flag,
                  title: Text('主标题选'),
                  subtitle: Text('副标题选择'),
                  onChanged: (v) {
                    setState(() {
                      this.flag = v!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
