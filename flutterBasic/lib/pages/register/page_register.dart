import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/model/language_model.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/language.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/utils/status_bar_util.dart';
import 'package:one_pay/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late List<LanguageItemModel> languageItems;
  bool _isChecked = false;
  final CustomPopupMenuController _controller = CustomPopupMenuController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _referralCode = TextEditingController();

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
              _getText(
                S.current.sign_up,
                textSize: 28,
                textWeight: FontWeight.w600,
                color: HsgColors.color190039,
              ),
              const SizedBox(height: 10),
              _getText(
                S.current.pay_desc,
                color: HsgColors.color878787.withOpacity(0.8),
              ),
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
              const SizedBox(height: 20),
              Container(
                width: ScreenUtil.instance.screenWidth - 60,
                padding: const EdgeInsets.only(left: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: HsgColors.colorF5F7FD.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _referralCode,
                  // inputFormatters: [
                  //   FilteringTextInputFormatter.allow(RegExp("[0-9]")), //只可输入数字
                  //   LengthLimitingTextInputFormatter(11),
                  // ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: S.current.referral_code,
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: HsgColors.color878787.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  _checkBox(
                    icon: _isChecked
                        ? 'assets/images/register/check-rectangle-filled.png'
                        : 'assets/images/register/check-rectangle-nor.png',
                  ),
                  const SizedBox(width: 10),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: S.current.terms_desc1,
                          style: const TextStyle(
                            color: HsgColors.color190039,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    child: Text(
                      S.current.terms_desc2,
                      style: const TextStyle(
                        color: HsgColors.themeOPColor,
                        fontSize: 12,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, pageRegisterTerms);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                width: double.infinity,
                margin: EdgeInsets.zero,
                text: Text(
                  S.current.get_otp,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                isEnable: _isChecked,
                clickCallback: () {
                  Navigator.pushNamed(
                    context,
                    pageOtp,
                    arguments: {
                      'userPhone': _phoneNumber.text,
                      'type': 'register'
                    },
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                child: Text(
                  S.current.login,
                  style: const TextStyle(
                      color: HsgColors.color190039, fontSize: 14),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, pageLogin);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _checkBox({required String icon}) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      child: Image.asset(
        icon,
        width: 18,
        height: 18,
      ),
    );
  }

  /// 区号与手机号输入框
  Row _gsmCodeAndMobile() {
    double _gsmCodeWidth = 76;
    return Row(
      children: [
        SizedBox(
          width: _gsmCodeWidth,
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
          width: ScreenUtil.instance.screenWidth - _gsmCodeWidth - 1 - 60,
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneNumber,
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
              arrowColor: Colors.white,
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
                      color: Colors.white,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Row(
                                    children: <Widget>[
                                      item.icon!,
                                      const Padding(
                                          padding: EdgeInsets.only(right: 6.0)),
                                      Text(
                                        item.title!,
                                        style: const TextStyle(
                                          color: Colors.black,
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
              pressType: PressType.singleClick)
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
}

class LanguageItemModel {
  String? title;
  Image? icon;
  String? value;

  LanguageItemModel({this.title, this.icon, this.value});
}
