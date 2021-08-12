/*
 * @Author: long_jj
 * @Date: 2021-08-12 15:50:11
 * @LastEditTime: 2021-08-12 15:52:38
 * @LastEditors: long_jj
 * @Description: 
 * @FilePath: \flutter_application_1\lib\pages\myDragSorting\test.dart
 */

main(List<String> args) {
  List<int> list = [1, 2, 3, 4];

  int a = list.removeAt(1);
  list.insert(3, a);
  print(a);
  print(list);
}
