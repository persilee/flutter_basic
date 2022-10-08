import 'dart:convert' as convert;
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_basic/utils/encrypt_util.dart';
import 'package:flutter_basic/utils/hive_store.dart';

import 'app_exceptions.dart';
import 'base_response.dart';

class ResponseInterceptor extends Interceptor {
  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (response.data == '') {
      return handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: AppException(
            '',
            'A system exception',
          ),
          type: DioErrorType.other,
        ),
        true,
      );
    }

    String key = await EncryptUtil.getInstance()
        .rsaDataDecode(response.headers.map['x-kont-key']?.first ?? '');
    String iv = await EncryptUtil.getInstance()
        .rsaDataDecode(response.headers.map['x-kont-iv']?.first ?? '');

    String uri = response.realUri.toString();
    // print('rspKey:$key => $uri');
    // print('rspIV:$iv => $uri');

    String decodeData =
        EncryptUtil.getInstance().aesDecode(response.data, key, iv);
    if (decodeData == '') return super.onResponse(response, handler);
    BaseResponse baseResponse =
        BaseResponse.fromJson(convert.jsonDecode(decodeData));

    log(convert.jsonEncode(baseResponse),
        name: "${response.realUri}->responseData");

    if (baseResponse.msgCd == '0000') {
      String? token = baseResponse.token;

      if ((token ?? '').isNotEmpty) {
        Boxes.userSecretConfigBox.put(ConfigKey.NET_TOKEN, token);
      }
      response.data = baseResponse.body;
    } else {
      return handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: AppException(
            baseResponse.msgCd ?? 'null',
            baseResponse.msgInfo ?? 'null',
          ),
          type: DioErrorType.other,
        ),
        true,
      );
    }
    return super.onResponse(response, handler);
  }
}
