// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "error_tip_end": MessageLookupByLibrary.simpleMessage(
            "---------------------错误提示---------------------"),
        "error_tip_noDataError": MessageLookupByLibrary.simpleMessage(
            "Data is abnormal, no data is returned!"),
        "error_tip_start": MessageLookupByLibrary.simpleMessage(
            "---------------------错误提示---------------------"),
        "navigation_coffee": MessageLookupByLibrary.simpleMessage("Services"),
        "navigation_profile": MessageLookupByLibrary.simpleMessage("Profile"),
        "navigation_wallet": MessageLookupByLibrary.simpleMessage("Wallet"),
        "network_error_cancel": MessageLookupByLibrary.simpleMessage(
            "The request has been cancelled, please request again"),
        "network_error_connect_timeout": MessageLookupByLibrary.simpleMessage(
            "Network connection timeout, please check network settings"),
        "network_error_http_400": MessageLookupByLibrary.simpleMessage(
            "The syntax requested by the client is incorrect, and the server cannot understand it"),
        "network_error_http_401": MessageLookupByLibrary.simpleMessage(
            "The request does not have permission"),
        "network_error_http_403": MessageLookupByLibrary.simpleMessage(
            "The server refused to execute"),
        "network_error_http_404": MessageLookupByLibrary.simpleMessage(
            "The resource you requested could not be found"),
        "network_error_http_405":
            MessageLookupByLibrary.simpleMessage("Request method is forbidden"),
        "network_error_http_500":
            MessageLookupByLibrary.simpleMessage("Server internal error"),
        "network_error_http_502":
            MessageLookupByLibrary.simpleMessage("Invalid request"),
        "network_error_http_503": MessageLookupByLibrary.simpleMessage(
            "Due to overload or system maintenance, the server is temporarily unable to process the client\'s request"),
        "network_error_http_505": MessageLookupByLibrary.simpleMessage(
            "The server does not support the requested HTTP protocol version and cannot be processed"),
        "network_error_http_unknown":
            MessageLookupByLibrary.simpleMessage("Unknown error"),
        "network_error_no_internet": MessageLookupByLibrary.simpleMessage(
            "Connection timeout, please check network."),
        "network_error_not_login": MessageLookupByLibrary.simpleMessage(
            "Login status has expired, please log in again!"),
        "network_error_receive_timeout": MessageLookupByLibrary.simpleMessage(
            "Response timed out, please try again later!"),
        "network_error_send_timeout": MessageLookupByLibrary.simpleMessage(
            "Network request timed out, please try again later!"),
        "network_error_unstable": MessageLookupByLibrary.simpleMessage(
            "The network is unstable, please request"),
        "sign_in": MessageLookupByLibrary.simpleMessage("Sign In"),
        "sign_up": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "welcome_desc":
            MessageLookupByLibrary.simpleMessage("Welcome to OnePay Wallet")
      };
}
