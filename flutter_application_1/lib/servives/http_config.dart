/*
 * @Author: long_jj
 * @Date: 2021-08-02 09:19:14
 * @LastEditTime: 2021-08-02 09:19:27
 * @LastEditors: long_jj
 * @Description: 文件中主要配置请求相关的一些公共配置
 * @FilePath: \flutter_application_1\lib\servives\http_config.dart
 */

// 请求服务器地址
const String baseUrl = 'http://test_api.com/';

// 请求连接
const Map urlPath = {
  'sms': 'login/sms',
};

// content-type
const Map contentType = {
  'json': "application/json",
  'form': "application/x-www-form-urlencoded"
};
