import 'dart:convert' as convert;
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_basic/utils/encrypt_util.dart';

import 'base_body.dart';

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    if (options.data != null && options.data is! FormData) {
      //请求头加请求体
      BaseBody baseBody = BaseBody(body: options.data);
      // print('RequestBody：${convert.jsonEncode(baseBody)}');
      log(convert.jsonEncode(baseBody), name: "${options.uri}->RequestBody");

      String baseBodyEncode = EncryptUtil.getInstance().aesEncode(
        convert.jsonEncode(baseBody),
        options.extra['key'],
        options.extra['iv'],
      );

      options.data = json.encode({'data': baseBodyEncode});
    }
    //清掉Key和IV
    options.extra.clear();
    options.responseType = ResponseType.plain;
    super.onRequest(options, handler);
  }
}
