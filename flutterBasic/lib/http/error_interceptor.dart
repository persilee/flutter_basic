import 'package:dio/dio.dart';

import 'app_exceptions.dart';

class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    handler.reject(
      DioError(
        requestOptions: err.requestOptions,
        error: AppException.create(err),
      ),
    );
  }
}
