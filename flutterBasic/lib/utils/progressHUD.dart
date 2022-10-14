/// Copyright (c) 2020 深圳高阳寰球科技有限公司
///
/// Author: jasonLong
/// Date: 2020-11-25
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_pay/http/app_exceptions.dart';
import 'package:one_pay/main.dart';

class HSProgressHUD {
  static void progressHudConfig() {
    // SVProgressHUD.setBackgroundColor(Color.fromRGBO(0, 0, 0, 0.8));
    // SVProgressHUD.setForegroundColor(Colors.white);
    // SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.clear);
    // SVProgressHUD.setMinimumDismissTimeInterval(1.0);

    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..radius = 21.0
      ..progressColor = Color(0xFF7B061B)
      ..backgroundColor = Color(0xFFE0E3EC)
      ..indicatorColor = Color(0xFF0A4773)
      ..textColor = Color(0xFF7B061B)
      ..textStyle = TextStyle(fontSize: 15, color: Color(0xFF7B061B))
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  static void show({
    String? status,
  }) {
    // SVProgressHUD.show(status: status);
    EasyLoading.show(status: status);
  }

  static void showToast(
    dynamic showContent,
  ) {
    // SVProgressHUD.dismiss();
    EasyLoading.dismiss();

    AppException error;

    if (showContent is NoSuchMethodError) {
      return;
    }

    if (showContent is AppException) {
      error = showContent;
    } else if (showContent is DioError && showContent.error is AppException) {
      error = showContent.error;
    } else {
      _showLogoutTips(navigatorKey.currentState!.overlay!.context);
      return;
    }

    String errorStr = error.message ?? (error.code ?? '');
    print('errorStr: ${error.toString()}');
    //(error.code ?? '') + (error.message ?? '');
    if (error.code == 'SYS90018' ||
        error.code == 'SYS90017' ||
        error is NeedLogin) {
    } else {
      showFluttertoast(errorStr);
    }
  }

  ///抛出未知错误的弹窗
  static _showLogoutTips(BuildContext context) {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return HsgAlertDialog(
    //         title: S.current.attention,
    //         message: S.current.progresshud_deserted_error,
    //         positiveButton: S.current.confirm,
    //         // negativeButton: S.current.cancel,
    //       );
    //     }).then((value) {
    //   if (value == true) {}
    // });
  }

  static void showToastTip(
    String tipStr,
  ) {
    // SVProgressHUD.dismiss();
    EasyLoading.dismiss();
    showFluttertoast(tipStr);
  }

  static void showProgress(
    double progress, {
    String? status,
  }) {
    // SVProgressHUD.showProgress(progress, status: status);
    EasyLoading.showProgress(progress, status: status);
  }

  static void dismiss({Duration? delay, VoidCallback? completion}) {
    // SVProgressHUD.dismiss(delay: delay, completion: completion);
    EasyLoading.dismiss();
  }

  static void showFluttertoast(String content) {
    // Fluttertoast.showToast(
    //   msg: content,
    //   gravity: ToastGravity.CENTER,
    //   timeInSecForIosWeb: 2,
    // );
    // HSProgressHUD.showMsgCenter(content);
    EasyLoading.showToast(content);
  }
}
