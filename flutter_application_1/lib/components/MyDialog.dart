/*
 * @Author: long_jj
 * @Date: 2021-07-30 15:53:42
 * @LastEditTime: 2021-08-05 15:44:58
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\components\MyDialog.dart
 */
import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, //设置透明度
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey.shade200,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                  left: 20, top: 0, right: 20, bottom: 0),
                              height: 30,
                              alignment: Alignment.center,
                              child: Text(
                                '标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题标题',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          Positioned(
                              right: 10,
                              top: 2,
                              child: InkWell(
                                child: Icon(
                                  Icons.close,
                                  size: 20,
                                  color: Colors.grey.shade400,
                                ),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ))
                        ],
                      ),
                    ),
                    //中间内容
                    Container(
                      width: double.infinity,
                      height: 130,
                      padding: EdgeInsets.all(15),
                      child: Text(
                        '啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的啊萨达阿斯顿飒飒的',
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    //底部按钮
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey.shade200,
                            width: 1.0,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: 30,
                            child: TextButton(
                              style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero),
                              ),
                              onPressed: () {},
                              child: Text('取消'),
                            ),
                          ),
                          SizedBox(width: 20),
                          Container(
                            height: 30,
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('确定')),
                          ),
                          SizedBox(width: 20)
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
