import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'base_body.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.data != null && options.data is! FormData) {
      //请求头加请求体
      // print('RequestBody：${convert.jsonEncode(baseBody)}');
      // log(convert.jsonEncode(baseBody), name: "${options.uri}->RequestBody");

      // String baseBodyEncode = EncryptUtil.getInstance().aesEncode(
      //   convert.jsonEncode(baseBody),
      //   options.extra['key'],
      //   options.extra['iv'],
      // );
      // print('options.data: ${BaseBody(data: options.data).toJson()}');
      options.data = BaseBody(data: options.data).toJson();
      if (kDebugMode) {
        print("requestData:${options.data}");
      }
    }
    //清掉Key和IV
    // options.extra.clear();
    // options.responseType = ResponseType.plain;
    super.onRequest(options, handler);
  }
}
