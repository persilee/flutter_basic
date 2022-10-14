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

  /// `Get OTP`
  String get get_otp {
    return Intl.message(
      'Get OTP',
      name: 'get_otp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to ACU PAY Wallet`
  String get welcome_desc {
    return Intl.message(
      'Welcome to ACU PAY Wallet',
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

  /// `---------------------李家伟国际化起点---------------------`
  String get joey_start {
    return Intl.message(
      '---------------------李家伟国际化起点---------------------',
      name: 'joey_start',
      desc: '',
      args: [],
    );
  }

  /// `Receive & Payment`
  String get receive_payment {
    return Intl.message(
      'Receive & Payment',
      name: 'receive_payment',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get payment {
    return Intl.message(
      'Payment',
      name: 'payment',
      desc: '',
      args: [],
    );
  }

  /// `Pay the Merchant`
  String get pay_the_merchant {
    return Intl.message(
      'Pay the Merchant',
      name: 'pay_the_merchant',
      desc: '',
      args: [],
    );
  }

  /// `---------------------李家伟国际化结尾---------------------`
  String get joey_end {
    return Intl.message(
      '---------------------李家伟国际化结尾---------------------',
      name: 'joey_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------JasonLong国际化起点---------------------`
  String get jasonLong_start {
    return Intl.message(
      '---------------------JasonLong国际化起点---------------------',
      name: 'jasonLong_start',
      desc: '',
      args: [],
    );
  }

  /// `Transfer`
  String get transfer_Text {
    return Intl.message(
      'Transfer',
      name: 'transfer_Text',
      desc: '',
      args: [],
    );
  }

  /// `Receiver OnePay Account`
  String get transfer_input_hit_text {
    return Intl.message(
      'Receiver OnePay Account',
      name: 'transfer_input_hit_text',
      desc: '',
      args: [],
    );
  }

  /// `Transfer to`
  String get transfer_title {
    return Intl.message(
      'Transfer to',
      name: 'transfer_title',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get transfer_next_text {
    return Intl.message(
      'Next',
      name: 'transfer_next_text',
      desc: '',
      args: [],
    );
  }

  /// `Recent Receiver`
  String get transfer_recent_receiver {
    return Intl.message(
      'Recent Receiver',
      name: 'transfer_recent_receiver',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get transfer_title_amountText {
    return Intl.message(
      'Amount',
      name: 'transfer_title_amountText',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance_with_value {
    return Intl.message(
      'Balance',
      name: 'balance_with_value',
      desc: '',
      args: [],
    );
  }

  /// `Debit Type`
  String get transfer_balace_Title {
    return Intl.message(
      'Debit Type',
      name: 'transfer_balace_Title',
      desc: '',
      args: [],
    );
  }

  /// `Please Select`
  String get please_select {
    return Intl.message(
      'Please Select',
      name: 'please_select',
      desc: '',
      args: [],
    );
  }

  /// `Purpose`
  String get purpose {
    return Intl.message(
      'Purpose',
      name: 'purpose',
      desc: '',
      args: [],
    );
  }

  /// `Purpose (optional)`
  String get purpose_optional {
    return Intl.message(
      'Purpose (optional)',
      name: 'purpose_optional',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get transfer_Confirm {
    return Intl.message(
      'Confirm',
      name: 'transfer_Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Click again to exit the application`
  String get exit_prompt {
    return Intl.message(
      'Click again to exit the application',
      name: 'exit_prompt',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Success`
  String get transfer_success_text {
    return Intl.message(
      'Transaction Success',
      name: 'transfer_success_text',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get transfer_Date {
    return Intl.message(
      'Date',
      name: 'transfer_Date',
      desc: '',
      args: [],
    );
  }

  /// `Trx.ID`
  String get transfer_trxID {
    return Intl.message(
      'Trx.ID',
      name: 'transfer_trxID',
      desc: '',
      args: [],
    );
  }

  /// `Repeat`
  String get transfer_repeat {
    return Intl.message(
      'Repeat',
      name: 'transfer_repeat',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get transfer_done {
    return Intl.message(
      'Done',
      name: 'transfer_done',
      desc: '',
      args: [],
    );
  }

  /// `Transaction PIN`
  String get input_transaction_pin {
    return Intl.message(
      'Transaction PIN',
      name: 'input_transaction_pin',
      desc: '',
      args: [],
    );
  }

  /// `Forget PIN?`
  String get transfer_forget_pin {
    return Intl.message(
      'Forget PIN?',
      name: 'transfer_forget_pin',
      desc: '',
      args: [],
    );
  }

  /// `Scan QR Code`
  String get transfer_qrcode_scan {
    return Intl.message(
      'Scan QR Code',
      name: 'transfer_qrcode_scan',
      desc: '',
      args: [],
    );
  }

  /// `The account is wrong, please try again~`
  String get sacn_result_error {
    return Intl.message(
      'The account is wrong, please try again~',
      name: 'sacn_result_error',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get transfer_scan_text {
    return Intl.message(
      'Scan',
      name: 'transfer_scan_text',
      desc: '',
      args: [],
    );
  }

  /// `The verification code length is incorrect.`
  String get smsCode_length_error {
    return Intl.message(
      'The verification code length is incorrect.',
      name: 'smsCode_length_error',
      desc: '',
      args: [],
    );
  }

  /// `There is no data ~`
  String get none_data_text {
    return Intl.message(
      'There is no data ~',
      name: 'none_data_text',
      desc: '',
      args: [],
    );
  }

  /// `OnePay Wallet`
  String get transfer_wallet_text {
    return Intl.message(
      'OnePay Wallet',
      name: 'transfer_wallet_text',
      desc: '',
      args: [],
    );
  }

  /// `New Card`
  String get transfer_next_card {
    return Intl.message(
      'New Card',
      name: 'transfer_next_card',
      desc: '',
      args: [],
    );
  }

  /// `Saving Account`
  String get transfer_card_type {
    return Intl.message(
      'Saving Account',
      name: 'transfer_card_type',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get home_transaction_text {
    return Intl.message(
      'Transaction',
      name: 'home_transaction_text',
      desc: '',
      args: [],
    );
  }

  /// `Top-up`
  String get home_topup_text {
    return Intl.message(
      'Top-up',
      name: 'home_topup_text',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw`
  String get home_withdraw_text {
    return Intl.message(
      'Withdraw',
      name: 'home_withdraw_text',
      desc: '',
      args: [],
    );
  }

  /// `---------------------JasonLong国际化结尾---------------------`
  String get jasonLong_end {
    return Intl.message(
      '---------------------JasonLong国际化结尾---------------------',
      name: 'jasonLong_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------collinChen国际化起点---------------------`
  String get collinChen_start {
    return Intl.message(
      '---------------------collinChen国际化起点---------------------',
      name: 'collinChen_start',
      desc: '',
      args: [],
    );
  }

  /// `User Profile`
  String get user_profile {
    return Intl.message(
      'User Profile',
      name: 'user_profile',
      desc: '',
      args: [],
    );
  }

  /// `My Cards`
  String get my_cards {
    return Intl.message(
      'My Cards',
      name: 'my_cards',
      desc: '',
      args: [],
    );
  }

  /// `ID Certification`
  String get id_certification {
    return Intl.message(
      'ID Certification',
      name: 'id_certification',
      desc: '',
      args: [],
    );
  }

  /// `Password Management`
  String get password_management {
    return Intl.message(
      'Password Management',
      name: 'password_management',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get about_us {
    return Intl.message(
      'About Us',
      name: 'about_us',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contact_us {
    return Intl.message(
      'Contact Us',
      name: 'contact_us',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message(
      'Balance',
      name: 'balance',
      desc: '',
      args: [],
    );
  }

  /// `Available Assets`
  String get available_assets {
    return Intl.message(
      'Available Assets',
      name: 'available_assets',
      desc: '',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: '',
      args: [],
    );
  }

  /// `---------------------collinChen国际化结尾---------------------`
  String get collinChen_end {
    return Intl.message(
      '---------------------collinChen国际化结尾---------------------',
      name: 'collinChen_end',
      desc: '',
      args: [],
    );
  }

  /// `---------------------AlexDeng国际化起点---------------------`
  String get AlexDeng_start {
    return Intl.message(
      '---------------------AlexDeng国际化起点---------------------',
      name: 'AlexDeng_start',
      desc: '',
      args: [],
    );
  }

  /// `ACU PAY, Pay Everywhere`
  String get pay_desc {
    return Intl.message(
      'ACU PAY, Pay Everywhere',
      name: 'pay_desc',
      desc: '',
      args: [],
    );
  }

  /// `LOGIN`
  String get login {
    return Intl.message(
      'LOGIN',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get title_OTP {
    return Intl.message(
      'OTP',
      name: 'title_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Confirm OTP`
  String get title_Confirm_OTP {
    return Intl.message(
      'Confirm OTP',
      name: 'title_Confirm_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone_number {
    return Intl.message(
      'Phone Number',
      name: 'phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Resend OTP`
  String get resend_OTP {
    return Intl.message(
      'Resend OTP',
      name: 'resend_OTP',
      desc: '',
      args: [],
    );
  }

  /// `Referral Code(optional)`
  String get referral_code {
    return Intl.message(
      'Referral Code(optional)',
      name: 'referral_code',
      desc: '',
      args: [],
    );
  }

  /// `I have read and agree to the`
  String get terms_desc1 {
    return Intl.message(
      'I have read and agree to the',
      name: 'terms_desc1',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get terms_desc2 {
    return Intl.message(
      'Terms & Conditions',
      name: 'terms_desc2',
      desc: '',
      args: [],
    );
  }

  /// `---------------------AlexDeng国际化结尾---------------------`
  String get AlexDeng_end {
    return Intl.message(
      '---------------------AlexDeng国际化结尾---------------------',
      name: 'AlexDeng_end',
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
