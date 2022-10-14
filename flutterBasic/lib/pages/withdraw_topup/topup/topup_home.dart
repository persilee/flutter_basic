import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/utils/format_util.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/input_generat_util.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_button.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

import '../../../http/model/transfer/user_card_list.dart';
import '../../../http/service/user_manager_service.dart';
import '../../../routes/routes.dart';
import '../../../utils/money_text_input_formatter.dart';
import '../../../utils/progressHUD.dart';
import '../../../widgets/hsg_dialog.dart';

class TopUpHomePage extends StatefulWidget {
  const TopUpHomePage({Key? key}) : super(key: key);

  @override
  State<TopUpHomePage> createState() => _TopUpHomePageState();
}

class _TopUpHomePageState extends State<TopUpHomePage> {
  ///Transfer Amount
  final TextEditingController _amountTEC = TextEditingController();
  final FocusNode _amountFN = FocusNode();

  final TextEditingController _fromAccTEC = TextEditingController();

  final List<BankCard> _cardList = [];
  String walletbBalance = '0';
  int _lastAccountIndex = 0;

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

  _loadUserCardList() {
    HSProgressHUD.show();
    UserManagerService()
        .getUserCardList(UserCardAccountListReq(bankAccountType: 1))
        .then((value) {
      HSProgressHUD.dismiss();
      if (mounted) {
        setState(() {
          walletbBalance = value.amount ?? '0';
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
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text(S.current.home_topup_text),
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
              //安卓的滑动效果，在ios中体现出不能使用弹簧效果
              // physics: const ClampingScrollPhysics(),
              child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const Image(
                width: 100,
                height: 100,
                image: AssetImage('assets/images/transfer/top_up_img.png')),
            const SizedBox(
              height: 10,
            ),
            Text(
                S.current.home_topup_text +
                    ' ' +
                    S.current.transfer_title_amountText,
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
                          FilteringTextInputFormatter.allow(RegExp('[0-9.]')),
                        ],
                        cursorColor: Colors.red,
                        focusNode: _amountFN,
                        controller: _amountTEC,
                        keyboardType: const TextInputType.numberWithOptions(
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
                            FormatUtil.formatSringToMoney(_amountTEC.text),
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
              ),
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
                // final Widget contentData = Column(children: [
                //   const SizedBox(
                //     height: 20,
                //   ),
                //   Text(
                //     S.current.transfer_title_amountText,
                //     style: const TextStyle(
                //         color: HsgColors.color190039, fontSize: 14),
                //   ),
                //   const SizedBox(
                //     height: 5,
                //   ),
                //   Text(
                //     '¥ ' +
                //         FormatUtil.formatSringToMoney(_amountTEC.text),
                //     style: const TextStyle(
                //         color: HsgColors.color190039,
                //         fontSize: 30,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ]);
                // CheckPayPassword(context, (value) {
                //   EasyLoading.show();
                //   if (value['password'] != '') {
                //     _commitTransfer(value['password']);
                //   }
                // }, contentWidget: contentData);
              },
            ),
          ]))),
    );
  }

  //获取支付账号
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
          // isShowBalance = result != 0 ? false : true;
          _lastAccountIndex = result;
          BankCard resultCard = _tempList[result];
          _fromAccTEC.text = resultCard.bankName ?? '';
          _checkButtonStatus();
        }
      });
    }
  }

//校验数据是否正确
  _checkButtonStatus() {
    bool isCanResult = false;
    return false;
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
}
