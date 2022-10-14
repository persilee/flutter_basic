import 'package:dio/dio.dart';
import 'package:one_pay/http/request_interceptor.dart';
import 'package:one_pay/http/response_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'error_interceptor.dart';
import 'header_interceptor.dart';

class BaseDio {
  static const BASEURL = "http://192.168.201.83:5040/"; //dev

  BaseDio._();

  static BaseDio? _instance;

  static BaseDio getInstance() {
    _instance ??= BaseDio._();

    return _instance!;
  }

  Dio getDio() {
    final Dio dio = Dio();

    /// 设置基本参数，如超时时间等 ...
    dio.options = BaseOptions(
        responseType: ResponseType.plain,
        receiveTimeout: 30000,
        connectTimeout: 30000);

    /// 添加拦截器，如 token之类，需要全局使用的参数
    dio.interceptors.add(HeaderInterceptor());

    /// 添加请求拦截器
    dio.interceptors.add(RequestInterceptor());

    /// 添加响应拦截器
    dio.interceptors.add(ResponseInterceptor());

    /// 添加error拦截器
    dio.interceptors.add(ErrorInterceptor());

    /// 添加日志格式化工具类
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: false,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

    return dio;
  }
}
