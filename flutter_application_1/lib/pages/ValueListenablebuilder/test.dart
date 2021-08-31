/*
 * @Author: long_jj
 * @Date: 2021-08-30 10:53:56
 * @LastEditTime: 2021-08-30 14:38:32
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\ValueListenablebuilder\test.dart
 */

class BackInfoBean {
  late String msg;
  late int code;

  BackInfoBean({required this.code, required this.msg});

  factory BackInfoBean.fromJson(Map<String, dynamic> json) {
    return BackInfoBean(
      msg: json['msg'],
      code: json['code'],
    );
  }
}

main(List<String> args) {
  var json = {
    'msg': '获取数据成功',
    'code': 200,
  };
  BackInfoBean _backInfoBean = BackInfoBean.fromJson(json);
  print(_backInfoBean.msg);
}
