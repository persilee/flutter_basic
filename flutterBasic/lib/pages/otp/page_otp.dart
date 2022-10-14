import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/http/app_exceptions.dart';
import 'package:one_pay/http/model/login_apply_req.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

import '../../http/app_exceptions.dart';
import '../../http/model/login_apply_req.dart';
import '../../http/model/login_confirm_req.dart';
import '../../http/model/register_apply_req.dart';
import '../../http/model/register_confirm_req.dart';
import '../../http/model/resend_otp_req.dart';
import '../../http/service/user_manager_service.dart';
import '../../routes/routes.dart';
import '../../utils/encrypt_util.dart';
import '../../utils/hive_store.dart';
import '../../utils/progressHUD.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/grid_input_view.dart';

class PageOtp extends StatefulWidget {
  final String? userPhone;
  final String? type;

  const PageOtp({
    Key? key,
    this.userPhone,
    this.type,
  }) : super(key: key);

  @override
  State<PageOtp> createState() => _PageOtpState();
}

class _PageOtpState extends State<PageOtp> {
  String? authId;
  late Timer _timer;
  int _endSeconds = 0;

  @override
  void initState() {
    super.initState();
    if (widget.type == "login") {
      _loadSmsCode();
    } else if (widget.type == "register") {
      _registerApply();
    }
  }

  void _loadSmsCode() {
    UserManagerService()
        .loginApply(
      LoginApplyReq(
        mobile: widget.userPhone,
        gsmCode: '86',
      ),
    )
        .then((value) {
      authId = value.authId;
      _endSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000 +
          (value.effectiveTime?.toInt() ?? 0);
      _startCountdown();
    }).catchError((e) {
      if (e.error is AppException) {
        AppException err = e.error as AppException;
        HSProgressHUD.showToastTip(err.message!);
      }
    });
  }

  void _registerApply() {
    UserManagerService()
        .registerApply(
      RegisterApplyReq(
        mobile: widget.userPhone,
        gsmCode: '86',
      ),
    )
        .then((value) {
      authId = value.authId;
      _endSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000 +
          (value.effectiveTime?.toInt() ?? 0);
      _startCountdown();
    }).catchError((e) {
      if (e.error is AppException) {
        AppException err = e.error as AppException;
        HSProgressHUD.showToastTip(err.message!);
      }
    });
  }

  void _resendOtp() {
    UserManagerService()
        .resendOtp(ResendOtpReq(authId: authId, mobile: widget.userPhone))
        .then((value) {
      _endSeconds = DateTime.now().millisecondsSinceEpoch ~/ 1000 +
          (value.effectiveTime?.toInt() ?? 0);
      _startCountdown();
    }).catchError((e) {
      if (e.error is AppException) {
        AppException err = e.error as AppException;
        HSProgressHUD.showToastTip(err.message!);
      }
    });
  }

  //倒计时方法
  void _startCountdown() {
    final call = (timer) {
      if (mounted) {
        setState(() {
          if (_endSeconds < DateTime.now().millisecondsSinceEpoch ~/ 1000) {
            _timer.cancel();
          }
        });
      }
    };
    _timer = Timer.periodic(const Duration(seconds: 1), call);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ///OTP按钮
    Widget _otpBtnWidget = CustomButton(
      height: 44,
      borderRadius: BorderRadius.circular(8),
      forbidColor: _endSeconds > DateTime.now().millisecondsSinceEpoch ~/ 1000
          ? HsgColors.colorF7F9FD
          : HsgColors.themeOPColor,
      text: Text(
        _endSeconds > DateTime.now().millisecondsSinceEpoch ~/ 1000
            ? '${_endSeconds - DateTime.now().millisecondsSinceEpoch ~/ 1000} s'
            : S.current.resend_OTP,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: HsgColors.colorffffff,
        ),
      ),
      isEnable: _endSeconds <= DateTime.now().millisecondsSinceEpoch ~/ 1000,
      clickCallback: () {
        _resendOtp();
      },
    );
    return CustomScaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(widget.type == "login"
            ? S.current.title_OTP
            : S.current.title_Confirm_OTP),
      ),
      body: SingleChildScrollView(
        //安卓的滑动效果，在ios中体现出不能使用弹簧效果
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Image.asset(
              "assets/images/login/icon_otp.png",
              height: 110,
            ),
            const SizedBox(height: 30),
            const Text("Please enter the 6-digit OTP sent via SMSto"),
            const Text("your registered phone No, *******123"),
            const SizedBox(height: 40),
            GridInputView(
              isAutofocus: true,
              isEncryption: false,
              limitLength: 6,
              callBack: (String inputStr) async {
                if (inputStr.length == 6) {
                  switch (widget.type) {
                    case "login":
                      return _login(inputStr);
                    case "register":
                      return _registerConfirm(inputStr);
                  }
                } else {
                  EasyLoading.showInfo(S.current.smsCode_length_error);
                }
              },
            ),
            const SizedBox(height: 40),
            _otpBtnWidget,
          ],
        ),
      ),
    );
  }

  void _login(String inputCode) {
    UserManagerService()
        .loginConfirm(LoginConfirmReq(
      authCode: inputCode,
      authId: authId,
      mobile: widget.userPhone,
    ))
        .then((value) {
      Boxes.userSecretConfigBox.put(ConfigKey.ACCESS_TOKEN, value.token);
      Boxes.userSecretConfigBox.put(
          ConfigKey.ACCESS_UID, EncryptUtil.generateMD5(value.userNo ?? ''));
      Navigator.pushNamed(context, pageNav);
    }).catchError((e) {
      if (e.error is AppException) {
        AppException err = e.error as AppException;
        HSProgressHUD.showToastTip(err.message!);
      }
    });
  }

  void _registerConfirm(String inputCode) {
    UserManagerService()
        .registerConfirm(RegisterConfirmReq(
      authCode: inputCode,
      authId: authId,
      mobile: widget.userPhone,
    ))
        .then((value) {
      Boxes.userSecretConfigBox.put(ConfigKey.ACCESS_TOKEN, value.token);
      Boxes.userSecretConfigBox.put(
          ConfigKey.ACCESS_UID, EncryptUtil.generateMD5(value.userNo ?? ''));
      Boxes.userSecretConfigBox.put(ConfigKey.UserNumber, value.userNo);

      Navigator.pushNamed(context, pageNav);
    }).catchError((e) {
      if (e.error is AppException) {
        AppException err = e.error as AppException;
        HSProgressHUD.showToastTip(err.message!);
      }
    });
  }
}
