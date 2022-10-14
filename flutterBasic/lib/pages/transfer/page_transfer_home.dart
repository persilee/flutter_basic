// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_pay/http/app_exceptions.dart';
import 'package:one_pay/http/model/transfer/transfer_partner_list.dart';
import 'package:one_pay/http/service/user_manager_service.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/input_generat_util.dart';
import 'package:one_pay/utils/progressHUD.dart';
import 'package:one_pay/utils/screen_size_fit.dart';
import 'package:one_pay/widgets/common_widgets.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_button.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';
import 'package:dio/dio.dart';

import '../../generated/l10n.dart';
import '../../http/model/transfer/transfer_onePay_account.dart';

class OPTransferHomePage extends StatefulWidget {
  const OPTransferHomePage({Key? key}) : super(key: key);

  @override
  State<OPTransferHomePage> createState() => _OPTransferHomePageState();
}

class _OPTransferHomePageState extends State<OPTransferHomePage> {
  final TextEditingController? _accountText = TextEditingController();
  final FocusNode? _accountFocusNode = FocusNode();
  bool enableNext = false;
  final List<PartnerRows> _partList = [];
  //用户信息数据
  TransOnePayAccountReq? userInfo;

  @override
  void initState() {
    super.initState();
    _loadPayeeList();
    _accountFocusNode!.addListener(() {
      if (!_accountFocusNode!.hasFocus) {
        if (_accountText!.text.isNotEmpty) {
          setState(() {
            enableNext = true;
          });
        } else {
          setState(() {
            enableNext = false;
          });
        }
      }
    });
  }

//获取输入钱包用户的信息
  _getUserAccountData() {
    HSProgressHUD.show();
    launchDataLoad(() {
      UserManagerService()
          .getUserAccountInfo(TransOnePayAccountReq(_accountText?.text, '86'))
          .then((value) {
        EasyLoading.dismiss();
        if (mounted) {
          setState(() {
            Navigator.pushNamed(context, pageTransferInputPage,
                arguments: {'userData': value});
          });
        }
      }).catchError((e) {
        HSProgressHUD.dismiss();
        if (e.error is AppException) {
          AppException err = e.error as AppException;
          HSProgressHUD.showToastTip(err.message!);
        }
      });
    });
  }

//获取收款人列表
  _loadPayeeList() async {
    EasyLoading.show();
    launchDataLoad(() {
      UserManagerService()
          .getUserPartnerList(TransferPartnerReq())
          .then((value) {
        EasyLoading.dismiss();
        if (mounted) {
          setState(() {
            if (value.contentData!.isNotEmpty) {
              _partList.addAll(value.contentData!);
            }
          });
        }
      }).catchError((e) {
        EasyLoading.dismiss();
        if (e.error is AppException) {
          AppException err = e.error as AppException;
          EasyLoading.showError(err.message!);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: Text(S.current.transfer_Text),
        ),
        body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    NewTranferInputWidget(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 8),
                      title: S.current.transfer_title,
                      hintText: S.current.transfer_input_hit_text,
                      keyboardType: TextInputType.number,
                      controller: _accountText,
                      focusNode: _accountFocusNode,
                      maxLines: 1,
                      isCustomInputFormatters: true,
                      regExp: '[0-9]',
                      isRegEXp: true,
                      callback: (text) {
                        setState(() {});
                      },
                    ),
                    CustomButton(
                      isEnable: enableNext,
                      margin:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      color: HsgColors.themeOPColor,
                      width: double.infinity,
                      text: Text(
                        S.current.transfer_next_text,
                        style: const TextStyle(
                          fontSize: 16,
                          color: HsgColors.colorffffff,
                        ),
                      ),
                      clickCallback: () {
                        _getUserAccountData();
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      color: HsgColors.bgColor,
                      height: 10,
                      width: AutoSizeFit.screenWidth,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 64,
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        S.current.transfer_recent_receiver,
                        style: const TextStyle(
                            color: HsgColors.color190039, fontSize: 16),
                      ),
                    ),
                    _partList.isNotEmpty ? _getAllRowsList() : _getNoneData()
                  ],
                ))));
  }

  //转出列表
  Widget _getAllRowsList() {
    List<Widget> _list = [];
    for (int i = 0; i < _partList.length; i++) {
      _list.add(_getRcentBuilder(_partList[i]));
    }
    return SizedBox(
        width: AutoSizeFit.screenWidth,
        height: AutoSizeFit.screenHeight,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 10),
          children: _list,
        ));
  }

  Widget _getNoneData() {
    double height = 300;
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/transfer/no_data_img.png'),
            width: 120,
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            S.current.none_data_text,
            style: const TextStyle(color: HsgColors.color190039, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _getRcentBuilder(PartnerRows list) {
    double? width = AutoSizeFit.screenWidth! - 80;
    return SizedBox(
        height: 60,
        width: AutoSizeFit.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 59,
              width: AutoSizeFit.screenWidth,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 10),
                    child: list.attachmentUrl != ''
                        ? Image(
                            width: 40,
                            height: 40,
                            image: NetworkImage(list.attachmentUrl ?? ''))
                        : const Image(
                            width: 40,
                            height: 40,
                            image: AssetImage(
                                'assets/images/home/icon_avatar.png'),
                          ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            list.customerName ?? '',
                            style: const TextStyle(
                                color: HsgColors.color15141F, fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            list.userNo ?? '',
                            style: const TextStyle(
                                color: HsgColors.color878787, fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 70, right: 20),
              height: 1,
              width: AutoSizeFit.screenWidth,
              color: HsgColors.colorf2f2f2,
            )
          ],
        ));
  }
}
