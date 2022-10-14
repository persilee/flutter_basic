import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/navigator_home.dart';
import 'package:one_pay/utils/screen_size_fit.dart';
import 'package:one_pay/widgets/custom_button.dart';

class TransferResultPage extends StatefulWidget {
  final Map? dataMap;
  const TransferResultPage({Key? key, this.dataMap}) : super(key: key);

  @override
  State<TransferResultPage> createState() => _TransferResultPageState();
}

class _TransferResultPageState extends State<TransferResultPage> {
  DateTime? _lastTime; //时间节点

  @override
  Widget build(BuildContext context) {
    Map? _argument;
    var listData = ModalRoute.of(context)!.settings.arguments;
    if (listData != null) {
      _argument = listData as Map;
    }

    return WillPopScope(
        onWillPop: _isExit,
        child: Scaffold(
            body: SingleChildScrollView(
                //安卓的滑动效果，在ios中体现出不能使用弹簧效果
                physics: const ClampingScrollPhysics(),
                child: Container(
                  width: AutoSizeFit.screenWidth,
                  height: AutoSizeFit.screenHeight,
                  color: HsgColors.themeOPColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.only(top: 85)),
                      SizedBox(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                  width: 40,
                                  height: 40,
                                  image: AssetImage(
                                      'assets/images/transfer/transfer_success.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                S.current.transfer_success_text,
                                style: const TextStyle(
                                    fontSize: 16, color: HsgColors.colorffffff),
                              )
                            ]),
                      ),
                      Container(
                          margin: const EdgeInsets.only(top: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25)),
                          child: _creatUserInfoWodgit(_argument)),
                      Container(
                          margin: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          padding: const EdgeInsets.only(
                              left: 14, right: 14, top: 15, bottom: 15),
                          decoration: BoxDecoration(
                              color: HsgColors.colorffffff,
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              _creatTransferInfo(
                                  S.current.transfer_balace_Title,
                                  _argument!['payType']),
                              const SizedBox(
                                height: 19,
                              ),
                              _creatTransferInfo(
                                  S.current.purpose, _argument['purpose']),
                              const SizedBox(
                                height: 19,
                              ),
                              _creatTransferInfo(
                                  S.current.transfer_Date, _argument['date']),
                              const SizedBox(
                                height: 19,
                              ),
                              _creatTransferInfo(
                                  S.current.transfer_trxID, _argument['trxId']),
                              const SizedBox(
                                height: 19,
                              ),
                            ],
                          )),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0, primary: HsgColors.cleanColor),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Image(
                                      width: 24,
                                      height: 24,
                                      image: AssetImage(
                                          'assets/images/transfer/transfer_repeat.png')),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    S.current.transfer_repeat,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: HsgColors.colorffffff),
                                  )
                                ]),
                          )),
                      CustomButton(
                        margin:
                            const EdgeInsets.only(left: 20, right: 20, top: 30),
                        width: double.infinity,
                        text: Text(
                          S.current.transfer_done,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: HsgColors.colorffffff,
                          ),
                        ),
                        isOutline: true,
                        outlineColor: HsgColors.colorffffff,
                        clickCallback: () {
                          navigatorToHome(context);
                          // Navigator.pushNamed(context, pageNav);
                        },
                      ),
                    ],
                  ),
                ))));
  }

  ///创建中间用户信息栏位
  Column _creatUserInfoWodgit(Map? _dataMap) {
    return Column(
      children: [
        Image(
            width: 50,
            height: 50,
            image: NetworkImage(_dataMap!['payeeImg'] ?? '')),
        const SizedBox(
          height: 10,
        ),
        Text(
          _dataMap['payeeInfo'] ?? '',
          style: const TextStyle(
              color: HsgColors.colorffffff,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        Text(
          _dataMap['amount'],
          style: const TextStyle(
              color: HsgColors.colorffffff,
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  ///创建转账信息
  Widget _creatTransferInfo(String leftText, String rightText) {
    return SizedBox(
      width: AutoSizeFit.screenWidth,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          leftText,
          style: const TextStyle(color: HsgColors.color878787, fontSize: 14),
        ),
        Text(
          rightText == '' ? '-' : rightText,
          style: const TextStyle(color: HsgColors.color190039, fontSize: 14),
        ),
      ]),
    );
  }

  Future<bool> _isExit() {
    if (_lastTime == null ||
        DateTime.now().difference(_lastTime!) >
            const Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      EasyLoading.showInfo(
        S.current.exit_prompt,
      );
      return Future.value(false);
    }
    Future.delayed(Duration.zero, () {
      exit(0);
    });
    return Future.value(true);
  }
}
