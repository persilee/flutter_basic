import 'dart:io';

import 'package:dio/dio.dart';
import 'package:one_pay/generated/l10n.dart';

/// 自定义异常
class AppException implements Exception {
  final String? message;
  final String? code;

  AppException(
    this.code,
    this.message,
  );

  @override
  String toString() {
    return 'AppException{$message,$code}';
  }

  String userUnderstandError() {
    String errorText = '';
    if (message == null || message == 'null') {
      errorText = code ?? '';
    } else if (code == null || code == 'null') {
      errorText = message ?? '';
    } else if ((code != null || code != 'null') &&
        (message != null || message != 'null')) {
      errorText = '$message';
    }

    return errorText;
  }

  factory AppException.create(DioError error) {
    switch (error.type) {
      case DioErrorType.cancel:
        return BadRequestException("-1", S.current.network_error_cancel);
      case DioErrorType.connectTimeout:
        return BadRequestException(
            "-1", S.current.network_error_connect_timeout);
      case DioErrorType.sendTimeout:
        return BadRequestException("-1", S.current.network_error_send_timeout);
      case DioErrorType.receiveTimeout:
        return BadRequestException(
            "-1", S.current.network_error_receive_timeout);
      case DioErrorType.response:
        try {
          final errCode = error.response?.statusCode;
          switch (errCode) {
            case 400:
              return BadRequestException(
                  "400", S.current.network_error_http_400);
            case 401:
              return UnauthorisedException(
                  "401", S.current.network_error_http_401);
            case 403:
              return UnauthorisedException(
                  "403", S.current.network_error_http_403);
            case 404:
              return UnauthorisedException(
                  "404", S.current.network_error_http_404);
            case 405:
              return UnauthorisedException(
                  "405", S.current.network_error_http_405);
            case 500:
              return UnauthorisedException(
                  "500", S.current.network_error_http_500);
            case 502:
              return UnauthorisedException(
                  "502", S.current.network_error_http_502);
            case 503:
              return UnauthorisedException(
                  "503", S.current.network_error_http_503);
            case 505:
              return UnauthorisedException(
                  "505", S.current.network_error_http_505);
            default:
              return AppException(
                  errCode.toString(),
                  error.response?.statusMessage ??
                      S.current.network_error_http_unknown);
          }
        } on Exception catch (_) {
          return AppException("-1", S.current.network_error_http_unknown);
        }
      case DioErrorType.other:
        {
          print('error: ${error.error.toString()}');
          if (error.error is SocketException) {
            return error.error =
                AppException("-1", S.current.network_error_no_internet);
          } else if (error.error is HttpException) {
            return error.error =
                AppException("-1", S.current.network_error_unstable);
          } else if (error.error is AppException) {
            AppException err = error.error as AppException;
            return error.error = AppException(err.code, err.message);
          }
          return error.error;
        }
      default:
        return AppException("-1", error.message);
    }
  }
}

/// 请求错误
class BadRequestException extends AppException {
  BadRequestException(String code, String message) : super(code, message);
}

/// 未认证异常
class UnauthorisedException extends AppException {
  UnauthorisedException(String code, String message) : super(code, message);
}

class NeedLogin extends AppException {
  NeedLogin([
    String? code = '401',
    String? message = '请先登录',
  ]) : super(code, message);
}
