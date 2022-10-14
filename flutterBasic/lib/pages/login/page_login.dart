import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/model/language_model.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hive_store.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/language.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/utils/status_bar_util.dart';
import 'package:one_pay/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class PageLogin extends StatefulWidget {
  const PageLogin({Key? key}) : super(key: key);

  @override
  State<PageLogin> createState() => _PageLoginState();
}

class _PageLoginState extends State<PageLogin> {
  late List<LanguageItemModel> languageItems;
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  final TextEditingController _phoneText = TextEditingController();

  @override
  void initState() {
    languageItems = [
      LanguageItemModel(
        title: 'EN',
        icon: Image.asset(
          'assets/images/language/language_select_en.png',
          fit: BoxFit.cover,
          height: 14.0,
        ),
        value: Language.EN,
      ),
      LanguageItemModel(
        title: 'CH',
        icon: Image.asset(
          'assets/images/language/language_select_CN.png',
          fit: BoxFit.cover,
          height: 14.0,
        ),
        value: Language.ZH_CN,
      ),
    ];
    _phoneText.text = '13184529326';
    Boxes.userSecretConfigBox.delete(ConfigKey.ACCESS_TOKEN);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatusBarUtil.setStatusBar(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: HsgColors.colorffffff,
      body: SingleChildScrollView(
        //安卓的滑动效果，在ios中体现出不能使用弹簧效果
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
            top: ScreenUtil.instance.statusBarHeight,
          ),
          child: Column(
            children: [
              _buildLanguageBtn(),
              const SizedBox(height: 35),
              _getText(S.current.login,
                  textSize: 28,
                  textWeight: FontWeight.w600,
                  color: HsgColors.color190039),
              const SizedBox(height: 10),
              _getText(S.current.pay_desc,
                  color: HsgColors.color878787.withOpacity(0.8)),
              const SizedBox(height: 40),
              Container(
                width: ScreenUtil.instance.screenWidth - 60,
                height: 50,
                decoration: BoxDecoration(
                  color: HsgColors.colorF5F7FD.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: _gsmCodeAndMobile(),
              ),
              const SizedBox(height: 81),
              CustomButton(
                width: double.infinity,
                margin: EdgeInsets.zero,
                text: Text(
                  S.current.get_otp,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: HsgColors.colorffffff,
                  ),
                ),
                isEnable: _phoneText.text.isNotEmpty,
                clickCallback: () {
                  Navigator.pushNamed(context, pageOtp, arguments: {
                    'userPhone': _phoneText.text,
                    'type': 'login'
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                color: HsgColors.colorffffff,
                width: 100,
                margin: EdgeInsets.zero,
                text: Text(
                  S.current.sign_up,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: HsgColors.color190039,
                  ),
                ),
                isOutline: false,
                clickCallback: () {
                  Navigator.pushNamed(context, pageReg);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// 区号与手机号输入框
  Row _gsmCodeAndMobile() {
    return Row(
      children: [
        SizedBox(
          width: 76,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              "+ 855",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: HsgColors.color190039,
              ),
            ),
          ),
        ),
        Container(
          color: const Color(0xFFD2D7E3),
          height: 20,
          width: 1,
        ),
        Container(
          width: ScreenUtil.instance.screenWidth - 76 - 1 - 60,
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneText,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")), //只可输入数字
                    LengthLimitingTextInputFormatter(11),
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.current.phone_number,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: HsgColors.color878787.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding _buildLanguageBtn() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomPopupMenu(
            controller: _controller,
            verticalMargin: 2,
            arrowColor: HsgColors.colorffffff,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<LanguageModel>().languageCountryCode,
                  style: const TextStyle(color: HsgColors.color333333),
                ),
                const Padding(padding: EdgeInsets.only(right: 2.0)),
                Image.asset(
                  'assets/images/language/icon_down.png',
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            menuBuilder: () => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                width: 90.0,
                color: HsgColors.colorffffff,
                child: Column(
                  children: languageItems
                      .map(
                        (item) => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            setState(() {
                              _controller.hideMenu();
                              context
                                  .read<LanguageModel>()
                                  .selectLanguage(item.value!);
                            });
                          },
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: <Widget>[
                                item.icon!,
                                const Padding(
                                    padding: EdgeInsets.only(right: 6.0)),
                                Text(
                                  item.title!,
                                  style: const TextStyle(
                                    color: HsgColors.color15141F,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            pressType: PressType.singleClick,
          ),
        ],
      ),
    );
  }

  /// 获取一个Text
  Widget _getText(
    String content, {
    double? textSize = 16,
    FontWeight? textWeight = FontWeight.w400,
    required Color color,
  }) {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontFamily: "Poppins",
        fontSize: textSize,
        fontWeight: textWeight,
      ),
    );
  }

/*void _login() {
    launchDataLoad(() async {
      HSProgressHUD.show();
      LoginApplyResp applyResp = await UserManagerService()
          .loginApply(LoginApplyReq(mobile: _phoneText.text, gsmCode: '86'));

      LoginConfirmResp loginConfirmResp =
          await UserManagerService().loginConfirm(LoginConfirmReq(
        authCode: '830586',
        authId: applyResp.authId,
        mobile: '13184529326',
      ));

      Boxes.userSecretConfigBox
          .put(ConfigKey.ACCESS_TOKEN, loginConfirmResp.token);
      Boxes.userSecretConfigBox
          .put(ConfigKey.ACCESS_UID, loginConfirmResp.customerNo);
      Boxes.userSecretConfigBox
          .put(ConfigKey.UserNumber, loginConfirmResp.userNo);
      HSProgressHUD.dismiss();
      Navigator.pushNamed(context, pageNav);
    });
  }*/
}

class LanguageItemModel {
  String? title;
  Image? icon;
  String? value;

  LanguageItemModel({this.title, this.icon, this.value});
}
