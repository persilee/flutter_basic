import 'package:flutter/material.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_size_fit.dart';
import 'package:one_pay/widgets/grid_input_view.dart';

import '../generated/l10n.dart';

// ignore: must_be_immutable
class HsgPasswordNewDialog extends StatefulWidget {
  final String? title;
  String? resultPage = '';
  Object? arguments = '';
  Widget? contentWidget; //中间需要显示的内容
  Function(String password)? returnPasswordFunc;

  HsgPasswordNewDialog(
      {Key? key,
      this.title,
      this.resultPage,
      this.arguments,
      this.returnPasswordFunc,
      this.contentWidget})
      : super(key: key);

  @override
  _HsgPasswordNewDialogState createState() => _HsgPasswordNewDialogState();
}

class _HsgPasswordNewDialogState extends State<HsgPasswordNewDialog> {
  double _contentHeight = 0.0;
  @override
  void initState() {
    super.initState();
    _contentHeight = widget.contentWidget != null
        ? AutoSizeFit.screenHeight! * 0.75
        : AutoSizeFit.screenHeight! * 0.65;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
        Navigator.of(context).pop();
      },
      child: SizedBox(
        height: _contentHeight,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(20),
        //   color: HsgColors.colorffffff,
        // ),
        child: Column(
          children: [
            Container(
                height: 58,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: AutoSizeFit.screenWidth,
                      child: Text(
                        widget.title ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0xFF313F4C),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            primary: HsgColors.cleanColor,
                            shadowColor: HsgColors.cleanColor),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Container(
                          color: HsgColors.cleanColor,
                          width: AutoSizeFit.screenWidth,
                          margin: EdgeInsets.only(
                              left: AutoSizeFit.screenWidth! - 60, top: 10),
                          child: const Image(
                              width: 16,
                              height: 16,
                              image: AssetImage(
                                  'assets/images/transfer/close.png')),
                        ))
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
              color: HsgColors.colorf2f2f2,
              height: 1,
            ),
            widget.contentWidget != null ? widget.contentWidget! : Container(),
            SizedBox(
              height: widget.contentWidget != null ? 30 : 50,
            ),
            GridInputView(
              isAutofocus: true,
              isEncryption: true,
              isDisFocus: false,
              boxSize: 40,
              isEnable: true,
              limitLength: 6,
              callBack: (String inputStr) {
                if (inputStr.length == 6) {
                  widget.returnPasswordFunc!(inputStr);
                  Navigator.of(context).pop();
                  // _verifyTradePaw(
                  //     inputStr, context, widget.resultPage, widget.arguments);
                }
              },
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0, primary: HsgColors.cleanColor),
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: Container(
                    width: AutoSizeFit.screenWidth,
                    margin: EdgeInsets.only(
                      left: AutoSizeFit.screenWidth! - 120,
                    ),
                    child: Text(
                      S.current.transfer_forget_pin,
                      style: const TextStyle(
                          color: HsgColors.themeOPColor, fontSize: 15),
                    ))),
          ],
        ),
      ),
    );
  }

  // _verifyTradePaw(String payPassword, BuildContext context, String? resultPage,
  //     Object? arguments) async {
  //   EasyLoading.show();
  //   String _passwordStr = EncryptUtil.aesEncode(payPassword);
  //   ApiClientPassword()
  //       .verifyTransPwdNoSms(VerifyTransPwdNoSmsReq(_passwordStr))
  //       .then((data) {
  //     EasyLoading.dismiss();
  //     if (widget.returnPasswordFunc != null) {
  //       widget.returnPasswordFunc(_passwordStr);
  //     }
  //     if (resultPage == '') {
  //       Navigator.pushNamed(context, resultPage, arguments: arguments);
  //     }
  //     Navigator.pop(context, true);
  //   }).catchError((e) {
  //     (context as Element).markNeedsBuild();
  //     EasyLoading.showToast(e);
  //   });
  // }
}
