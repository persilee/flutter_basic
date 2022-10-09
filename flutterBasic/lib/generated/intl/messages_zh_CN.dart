// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a zh_CN locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'zh_CN';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error_tip_end": MessageLookupByLibrary.simpleMessage(
            "---------------------错误提示---------------------"),
        "error_tip_noDataError":
            MessageLookupByLibrary.simpleMessage("数据异常，未返回数据！"),
        "error_tip_start": MessageLookupByLibrary.simpleMessage(
            "---------------------错误提示---------------------"),
        "navigation_coffee": MessageLookupByLibrary.simpleMessage("服务"),
        "navigation_profile": MessageLookupByLibrary.simpleMessage("个人"),
        "navigation_wallet": MessageLookupByLibrary.simpleMessage("钱包"),
        "network_error_cancel":
            MessageLookupByLibrary.simpleMessage("请求已被取消，请重新请求"),
        "network_error_connect_timeout":
            MessageLookupByLibrary.simpleMessage("网络连接超时，请检查网络设置"),
        "network_error_http_400":
            MessageLookupByLibrary.simpleMessage("客户端请求的语法错误，服务器无法理解"),
        "network_error_http_401":
            MessageLookupByLibrary.simpleMessage("请求没有权限"),
        "network_error_http_403":
            MessageLookupByLibrary.simpleMessage("服务器拒绝执行"),
        "network_error_http_404":
            MessageLookupByLibrary.simpleMessage("您所请求的资源无法找到"),
        "network_error_http_405":
            MessageLookupByLibrary.simpleMessage("请求方法被禁止"),
        "network_error_http_500":
            MessageLookupByLibrary.simpleMessage("服务器内部错误"),
        "network_error_http_502": MessageLookupByLibrary.simpleMessage("无效的请求"),
        "network_error_http_503":
            MessageLookupByLibrary.simpleMessage("由于超载或系统维护，服务器暂时的无法处理客户端的请求"),
        "network_error_http_505":
            MessageLookupByLibrary.simpleMessage("服务器不支持请求的HTTP协议的版本，无法完成处理"),
        "network_error_http_unknown":
            MessageLookupByLibrary.simpleMessage("未知错误"),
        "network_error_no_internet":
            MessageLookupByLibrary.simpleMessage("网络连接超时，请检查网络。"),
        "network_error_not_login":
            MessageLookupByLibrary.simpleMessage("登录状态已失效，请重新登录！"),
        "network_error_receive_timeout":
            MessageLookupByLibrary.simpleMessage("响应超时，请稍后重试！"),
        "network_error_send_timeout":
            MessageLookupByLibrary.simpleMessage("网络请求超时，请稍后重试！"),
        "network_error_unstable":
            MessageLookupByLibrary.simpleMessage("网络不稳定，请重新请求"),
        "sign_in": MessageLookupByLibrary.simpleMessage("登录"),
        "sign_up": MessageLookupByLibrary.simpleMessage("注册"),
        "welcome_desc": MessageLookupByLibrary.simpleMessage("欢迎使用 OnePay 钱包")
      };
}
