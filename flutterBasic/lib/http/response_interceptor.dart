import 'package:dio/dio.dart';
import 'package:one_pay/http/base_response.dart';

import 'app_exceptions.dart';

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

    // String key = await EncryptUtil.getInstance()
    //     .rsaDataDecode(response.headers.map['x-kont-key']?.first ?? '');
    // String iv = await EncryptUtil.getInstance()
    //     .rsaDataDecode(response.headers.map['x-kont-iv']?.first ?? '');
    //
    // String uri = response.realUri.toString();
    // print('rspKey:$key => $uri');
    // print('rspIV:$iv => $uri');

    // String decodeData =
    //     EncryptUtil.getInstance().aesDecode(response.data, key, iv);
    // if (decodeData == '') return super.onResponse(response, handler);
    // BaseResponse baseResponse =
    //     BaseResponse.fromJson(convert.jsonDecode(decodeData));
    //
    // log(convert.jsonEncode(baseResponse),
    //     name: "${response.realUri}->responseData");
    BaseResponse baseResponse = BaseResponse.fromJson(response.data);
    print('response.data: ${baseResponse.state}');
    print('response.data: ${baseResponse.toJson()}');
    if (baseResponse.state == 0) {
      // String? token = baseResponse.token;
      //
      // if ((token ?? '').isNotEmpty) {
      //   Boxes.userSecretConfigBox.put(ConfigKey.NET_TOKEN, token);
      // }
      if (baseResponse.data is Map) {
        response.data = baseResponse.data;
      } else if (baseResponse.data == null) {
        response.data = <String, dynamic>{};
      } else {
        Map<String, dynamic> _dataMap = {'contentData': baseResponse.data};
        response.data = _dataMap;
      }

      // if (baseResponse.data is List<dynamic> &&
      //     (baseResponse.data as List).isEmpty) {
      //   response.data = <String, dynamic>{};
      // } else {
      //   response.data = baseResponse.data;
      // }
    } else {
      return handler.reject(
        DioError(
          requestOptions: response.requestOptions,
          error: AppException(
            baseResponse.code ?? 'null',
            baseResponse.message ?? 'null',
          ),
          type: DioErrorType.other,
        ),
        true,
      );
    }
    return super.onResponse(response, handler);
  }
}
