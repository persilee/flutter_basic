import 'dart:ui';

import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:one_pay/http/app_exceptions.dart';
import 'package:one_pay/http/service/user_manager_service.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/input_generat_util.dart';
import 'package:one_pay/utils/pay_password_check.dart';
import 'package:one_pay/utils/progressHUD.dart';
import 'package:one_pay/utils/screen_size_fit.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';
import 'package:one_pay/widgets/hsg_dialog.dart';
import 'package:one_pay/widgets/small_data_store.dart';
import '../../http/model/transfer/transfer_commit.dart';
import '../../http/order_generate.dart';

import '../../generated/l10n.dart';
import '../../http/model/transfer/transfer_onePay_account.dart';
import '../../http/model/transfer/user_card_list.dart';
import '../../utils/format_util.dart';
import '../../utils/money_text_input_formatter.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/textflield_utf8_length_limit.dart';

class TransferInputInfomationPage extends StatefulWidget {
  final TransOnePayAccountResp? userData;

  const TransferInputInfomationPage({Key? key, this.userData})
      : super(key: key);

  @override
  State<TransferInputInfomationPage> createState() =>
      _TransferInputInfomationPageState();
}

class _TransferInputInfomationPageState
    extends State<TransferInputInfomationPage> {
  ///Transfer Amount
  final TextEditingController _amountTEC = TextEditingController();
  final FocusNode _amountFN = FocusNode();

  final TextEditingController _fromAccTEC = TextEditingController();

  final TextEditingController _remarkTEC = TextEditingController();
  final FocusNode _remarkFN = FocusNode();

  final List<BankCard> _cardList = [];
  String walletbBalance = '0'; //钱包余额
  String walletbAccount = '0'; //钱包账户
  BankCard? resultCard; //选择的卡账户

  int _lastAccountIndex = 0;
  bool isShowBalance = true;

  @override
  void initState() {
    super.initState();

    _amountTEC.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    _amountFN.addListener(() {
      if (!_amountFN.hasFocus) {
        setState(() {
          _checkButtonStatus();
        });
      }
    });
    _loadUserCardList();
  }

//获取用户的卡信息
  _loadUserCardList() {
    walletbBalance = '0';
    walletbAccount = '';
    _cardList.clear();
    HSProgressHUD.show();
    UserManagerService()
        .getUserCardList(UserCardAccountListReq(bankAccountType: 1))
        .then((value) {
      HSProgressHUD.dismiss();
      if (mounted) {
        setState(() {
          walletbBalance = value.amount ?? '0';
          walletbAccount = value.accountNo ?? '';
          _cardList.addAll(value.getUserBindingBankAccountsList!);
          _fromAccTEC.text = S.current.transfer_wallet_text;
        });
      }
    }).catchError((e) {
      HSProgressHUD.showToastTip(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    var dataArgument = ModalRoute.of(context)!.settings.arguments;
    if (dataArgument != null) {
      //这里应该是可以拿到账户和名称的
    }
    return CustomScaffold(
        topHeight: 148,
        appBar: CustomAppBar(
          title: Text(
            S.current.transfer_Text,
          ),
        ),
        body: SizedBox(
            child: Column(children: [
          Container(
              width: AutoSizeFit.screenWidth,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: AutoSizeFit.screenWidth! - 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.current.transfer_title,
                          style: const TextStyle(
                              color: HsgColors.colorffffff, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          widget.userData!.customerName! +
                              ' ' +
                              '(' +
                              FormatUtil.hideNumber(widget.userData!.mobile!) +
                              ')',
                          style: const TextStyle(
                              color: HsgColors.colorffffff,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 21),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: widget.userData!.attachmentUrl! != ''
                        ? Image(
                            width: 40,
                            height: 40,
                            image:
                                NetworkImage(widget.userData!.attachmentUrl!),
                          )
                        : const Image(
                            width: 40,
                            height: 40,
                            image: AssetImage(
                                'assets/images/home/icon_avatar.png'),
                          ),
                  )
                ],
              )),
          Expanded(
              child: Container(
                  margin: const EdgeInsets.only(
                    top: 40,
                    left: 20,
                    right: 20,
                  ),
                  height: AutoSizeFit.screenHeight! - 60,
                  child: SingleChildScrollView(
                      //安卓的滑动效果，在ios中体现出不能使用弹簧效果
                      // physics: const ClampingScrollPhysics(),
                      child: Column(children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text(S.current.transfer_title_amountText,
                        style: const TextStyle(
                          fontSize: 14,
                          color: HsgColors.color190039,
                        )),
                    Stack(
                      children: [
                        Opacity(
                          opacity: 1,
                          child: SizedBox(
                            width: 0,
                            height: 0,
                            child: TextField(
                                decoration: const InputDecoration(
                                    fillColor: Colors.green, filled: false),
                                //是否自动更正
                                autocorrect: false,
                                //是否自动获得焦点
                                autofocus: true,
                                //是否密文
                                obscureText: false,
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(15),
                                  MoneyTextInputFormatter(),
                                  FilteringTextInputFormatter.allow(
                                      RegExp('[0-9.]')),
                                ],
                                cursorColor: Colors.red,
                                focusNode: _amountFN,
                                controller: _amountTEC,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        decimal: true)),
                          ),
                        ),
                        Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(_amountFN);
                            },
                            child: FittedBox(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    '¥ ',
                                    style: TextStyle(
                                        fontSize: 30,
                                        color: HsgColors.color190039,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    FormatUtil.formatSringToMoney(
                                        _amountTEC.text),
                                    style: const TextStyle(
                                        fontSize: 30,
                                        color: HsgColors.color190039,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: HsgColors.colorf2f2f2,
                      height: 0.5,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    InkWell(
                      onTap: () {
                        //选择卡弹窗
                        _payerAccountDialog();
                      },
                      child: NewTranferInputWidget(
                        height: 120,
                        margin: EdgeInsets.zero,
                        title: S.current.transfer_balace_Title,
                        hintText: S.of(context).please_select,
                        widget: _selectCardWidget(),
                        keyboardType: TextInputType.number,
                        controller: _fromAccTEC,
                        callback: (text) {
                          setState(() {});
                        },
                        enabled: false,
                        length: 20,
                        isRegEXp: true,
                        regExp: '[0-9]',
                        isWidget: true,
                        isBottomWidget: isShowBalance,
                        bottomWidget: _getBalanceWidget(),
                      ),
                    ),
                    NewTranferInputWidget(
                      margin: EdgeInsets.zero,
                      title: S.current.purpose,
                      hintText: S.current.purpose_optional,
                      keyboardType: TextInputType.text,
                      controller: _remarkTEC,
                      focusNode: _remarkFN,
                      maxLines: 1,
                      isCustomInputFormatters: false,
                      inputFormatters: [
                        Utf8LengthLimitingTextInputFormatter(64),
                        FilteringTextInputFormatter.deny(
                            RegExp(InputFormartterRegExp.REGEX_EMOJI)) //不允许表情
                      ],
                      callback: (text) {
                        setState(() {});
                      },
                    ),
                    CustomButton(
                      isEnable: _checkButtonStatus(),
                      margin: const EdgeInsets.only(top: 10),
                      color: HsgColors.themeOPColor,
                      width: double.infinity,
                      text: Text(
                        S.current.transfer_Confirm,
                        style: const TextStyle(
                          fontSize: 16,
                          color: HsgColors.colorffffff,
                        ),
                      ),
                      clickCallback: () {
                        final Widget contentData = Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            S.current.transfer_title_amountText,
                            style: const TextStyle(
                                color: HsgColors.color190039, fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '¥ ' +
                                FormatUtil.formatSringToMoney(_amountTEC.text),
                            style: const TextStyle(
                                color: HsgColors.color190039,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                        ]);
                        CheckPayPassword(context, (value) {
                          EasyLoading.show();
                          if (value['password'] != '') {
                            _commitTransfer(value['password']);
                          }
                        }, contentWidget: contentData);
                      },
                    ),
                  ]))))
        ])));
  }

  //余额组件
  Widget _getBalanceWidget() {
    return Container(
      height: 19,
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          RichText(
            maxLines: 1,
            text: TextSpan(
                text: S.current.balance_with_value + ': ',
                style: const TextStyle(
                    color: HsgColors.color999999, fontSize: 12, height: 1),
                children: [
                  TextSpan(
                      text: FormatUtil.formatSringToMoney(walletbBalance),
                      style: const TextStyle(
                          color: HsgColors.colorC30D23,
                          fontSize: 12,
                          height: 1))
                ]),
          ),
        ],
      ),
    );
  }

//账户弹窗
  _payerAccountDialog() async {
    List<BankCard> _tempList = [];
    _tempList.addAll(_cardList);
    BankCard card =
        BankCard(walletbBalance, 3, S.current.transfer_wallet_text, '');
    _tempList.insert(0, card);
    final result = await showHsgBottomSheet(
        barrierColor: HsgColors.dioBgColor,
        context: context,
        builder: (context) {
          return HsgBottomSingleChoice(
            title: S.current.transfer_balace_Title,
            items: _tempList,
            lastSelectedPosition: _lastAccountIndex,
          );
        });
    if (result != null && result != '' && result != -1) {
      setState(() {
        if (result == _tempList.length) {
          //如果是点击的新卡，直接跳转新卡
          Navigator.pushNamed(context, pageUserNewCard);
        } else {
          isShowBalance = result != 0 ? false : true;
          _lastAccountIndex = result;
          BankCard resultCard = _tempList[result];
          resultCard = resultCard;
          _fromAccTEC.text = resultCard.bankName ?? '';
          _checkButtonStatus();
        }
      });
    }
  }

  Widget _selectCardWidget() {
    return Container(
      width: 25,
      height: double.infinity,
      padding: const EdgeInsets.all(2),
      child: Image.asset(
        'assets/images/transfer/transfer_drop_down.png',
      ),
    );
  }

  ///判断按钮是否可以进行下一步
  bool _checkButtonStatus() {
    bool isCanResult = false;
    double amount = double.parse(_amountTEC.text != '' ? _amountTEC.text : '0');
    double wallet = double.parse(walletbBalance != '' ? walletbBalance : '0');

    if ((_lastAccountIndex == 0 && amount > wallet) ||
        double.parse(_amountTEC.text != '' ? _amountTEC.text : '0') > 0) {
      isCanResult = true;
    } else {
      isCanResult = false;
    }
    return isCanResult;
  }

//提交转账
  _commitTransfer(String password) {
    HSProgressHUD.show();
    TransferCommitReq req = TransferCommitReq(
        payType: isShowBalance ? '03' : '00', //支付类型
        payer: {
          'bankAccountNo': isShowBalance ? '' : resultCard!.bankAccountNo,
          "accountNo": isShowBalance ? walletbAccount : '',
          "qrCode": ''
        }, //付款方的信息
        payee: {
          'bankAccountNo': '',
          "payeeMobile": widget.userData!.mobile
        }, //收款方的信息
        orderNo: OrderGeneratFile().creatOrderIdNo(), //订单号
        description: _remarkTEC.text, //描述
        amount: {'total': _amountTEC.text, 'currency': "CNY"}, //数量与币种
        safeInfo: {'payPassword': password});
    UserManagerService().transferCommitRequest(req).then((value) {
      HSProgressHUD.dismiss();
      if (mounted) {
        setState(() {
          Map _data = {
            'payeeImg': widget.userData!.attachmentUrl,
            'payeeInfo': widget.userData!.customerName! +
                ' ' +
                '(' +
                FormatUtil.hideNumber(widget.userData!.mobile!) +
                ')',
            'amount': '¥ ' + _amountTEC.text,
            'payType': _fromAccTEC.text,
            'purpose': _remarkTEC.text,
            'date': value.payTime,
            'trxId': value.transNo,
          };
          Navigator.pushNamed(context, pageTransferResult, arguments: _data)
              .then((value) {
            setState(() {
              _amountTEC.text = '';
              _checkButtonStatus();
            });
          });
        });
      }
    }).catchError((e) {
      AppException err = e.error as AppException;
      HSProgressHUD.showToastTip(err.message!);
    });
  }
}
