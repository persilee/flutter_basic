// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to OnePay Wallet`
  String get welcome_desc {
    return Intl.message(
      'Welcome to OnePay Wallet',
      name: 'welcome_desc',
      desc: '',
      args: [],
    );
  }

  /// `Wallet`
  String get navigation_wallet {
    return Intl.message(
      'Wallet',
      name: 'navigation_wallet',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get navigation_coffee {
    return Intl.message(
      'Services',
      name: 'navigation_coffee',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navigation_profile {
    return Intl.message(
      'Profile',
      name: 'navigation_profile',
      desc: '',
      args: [],
    );
  }

  /// `---------------------错误提示---------------------`
  String get error_tip_start {
    return Intl.message(
      '---------------------错误提示---------------------',
      name: 'error_tip_start',
      desc: '',
      args: [],
    );
  }

  /// `Data is abnormal, no data is returned!`
  String get error_tip_noDataError {
    return Intl.message(
      'Data is abnormal, no data is returned!',
      name: 'error_tip_noDataError',
      desc: '',
      args: [],
    );
  }

  /// `The request has been cancelled, please request again`
  String get network_error_cancel {
    return Intl.message(
      'The request has been cancelled, please request again',
      name: 'network_error_cancel',
      desc: '',
      args: [],
    );
  }

  /// `Network connection timeout, please check network settings`
  String get network_error_connect_timeout {
    return Intl.message(
      'Network connection timeout, please check network settings',
      name: 'network_error_connect_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Network request timed out, please try again later!`
  String get network_error_send_timeout {
    return Intl.message(
      'Network request timed out, please try again later!',
      name: 'network_error_send_timeout',
      desc: '',
      args: [],
    );
  }

  /// `Response timed out, please try again later!`
  String get network_error_receive_timeout {
    return Intl.message(
      'Response timed out, please try again later!',
      name: 'network_error_receive_timeout',
      desc: '',
      args: [],
    );
  }

  /// `The syntax requested by the client is incorrect, and the server cannot understand it`
  String get network_error_http_400 {
    return Intl.message(
      'The syntax requested by the client is incorrect, and the server cannot understand it',
      name: 'network_error_http_400',
      desc: '',
      args: [],
    );
  }

  /// `The request does not have permission`
  String get network_error_http_401 {
    return Intl.message(
      'The request does not have permission',
      name: 'network_error_http_401',
      desc: '',
      args: [],
    );
  }

  /// `The server refused to execute`
  String get network_error_http_403 {
    return Intl.message(
      'The server refused to execute',
      name: 'network_error_http_403',
      desc: '',
      args: [],
    );
  }

  /// `The resource you requested could not be found`
  String get network_error_http_404 {
    return Intl.message(
      'The resource you requested could not be found',
      name: 'network_error_http_404',
      desc: '',
      args: [],
    );
  }

  /// `Request method is forbidden`
  String get network_error_http_405 {
    return Intl.message(
      'Request method is forbidden',
      name: 'network_error_http_405',
      desc: '',
      args: [],
    );
  }

  /// `Server internal error`
  String get network_error_http_500 {
    return Intl.message(
      'Server internal error',
      name: 'network_error_http_500',
      desc: '',
      args: [],
    );
  }

  /// `Invalid request`
  String get network_error_http_502 {
    return Intl.message(
      'Invalid request',
      name: 'network_error_http_502',
      desc: '',
      args: [],
    );
  }

  /// `Due to overload or system maintenance, the server is temporarily unable to process the client's request`
  String get network_error_http_503 {
    return Intl.message(
      'Due to overload or system maintenance, the server is temporarily unable to process the client\'s request',
      name: 'network_error_http_503',
      desc: '',
      args: [],
    );
  }

  /// `The server does not support the requested HTTP protocol version and cannot be processed`
  String get network_error_http_505 {
    return Intl.message(
      'The server does not support the requested HTTP protocol version and cannot be processed',
      name: 'network_error_http_505',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get network_error_http_unknown {
    return Intl.message(
      'Unknown error',
      name: 'network_error_http_unknown',
      desc: '',
      args: [],
    );
  }

  /// `Connection timeout, please check network.`
  String get network_error_no_internet {
    return Intl.message(
      'Connection timeout, please check network.',
      name: 'network_error_no_internet',
      desc: '',
      args: [],
    );
  }

  /// `Login status has expired, please log in again!`
  String get network_error_not_login {
    return Intl.message(
      'Login status has expired, please log in again!',
      name: 'network_error_not_login',
      desc: '',
      args: [],
    );
  }

  /// `The network is unstable, please request`
  String get network_error_unstable {
    return Intl.message(
      'The network is unstable, please request',
      name: 'network_error_unstable',
      desc: '',
      args: [],
    );
  }

  /// `---------------------错误提示---------------------`
  String get error_tip_end {
    return Intl.message(
      '---------------------错误提示---------------------',
      name: 'error_tip_end',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
