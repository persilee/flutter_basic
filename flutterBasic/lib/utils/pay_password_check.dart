import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/hsg_password_dialog_new.dart';
import 'package:one_pay/widgets/hsg_dialog.dart';

// ignore: non_constant_identifier_names
Future<String> CheckPayPassword(
    BuildContext context, Function(Map resultsData) callback,
    {String? titleName, Widget? contentWidget}) {
  return _openBottomSheet(context, callback,
      titleName: titleName ?? '', contentWidget: contentWidget);
}

//点击提校验交易密码
Future<String> _openBottomSheet(
    BuildContext context, Function(Map resultsData) callback,
    {String? titleName, Widget? contentWidget}) async {
  // bool passwordEnabled =
  //     Boxes.userConfigBox.get(ConfigKey.USER_PASSWORDENABLED);
  // // 判断是否设置交易密码，如果没有设置，跳转到设置密码页面，
  // if (!passwordEnabled) {
  //   HsgShowTip.shouldSetTranPasswordTip(
  //     context: context,
  //     click: (value) {
  //       if (value == true) {
  //         //前往设置交易密码
  //         Navigator.pushNamed(context, setPayPage);
  //       }
  //     },
  //   );
  //   return '';
  // } else {
  // 输入交易密码
  String password =
      await _didBottomSheet(context, callback, titleName ?? '', contentWidget);
  // // 如果交易密码正确，处理审批逻辑
  // if (password.length > 0) {
  //   callback({
  //     'password': password ?? '',
  //   });
  // }
  return password;
  // }
}

//交易密码窗口
Future<String> _didBottomSheet(
    BuildContext context,
    Function(Map resultsData) callback,
    String? titleName,
    Widget? contentWidget) async {
  String passwordStr = '';
  final isPassword = await showHsgBottomSheet(
      barrierColor: HsgColors.dioBgColor,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return HsgPasswordNewDialog(
          title: titleName == '' ? S.current.input_transaction_pin : titleName,
          contentWidget: contentWidget,
          returnPasswordFunc: (password) {
            passwordStr = password;
            callback({
              'password': password,
            });
          },
        );
      });
  if (isPassword != null && isPassword == true) {
    return passwordStr;
  }
  FocusManager.instance.primaryFocus?.unfocus();
  return '';
}
