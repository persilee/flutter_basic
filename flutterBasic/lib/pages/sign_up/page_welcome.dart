import 'package:custom_pop_up_menu/custom_pop_up_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/generated/l10n.dart';
import 'package:flutter_basic/http/model/login_apply_req.dart';
import 'package:flutter_basic/http/model/login_apply_resp.dart';
import 'package:flutter_basic/http/model/login_confirm_req.dart';
import 'package:flutter_basic/http/model/login_confirm_resp.dart';
import 'package:flutter_basic/http/service/user_manager_service.dart';
import 'package:flutter_basic/model/language_model.dart';
import 'package:flutter_basic/routes/routes.dart';
import 'package:flutter_basic/utils/hive_store.dart';
import 'package:flutter_basic/utils/language.dart';
import 'package:flutter_basic/utils/screen_util.dart';
import 'package:flutter_basic/utils/status_bar_util.dart';
import 'package:flutter_basic/widgets/common_widgets.dart';
import 'package:flutter_basic/widgets/custom_button.dart';
import 'package:provider/src/provider.dart';

class PageWelcome extends StatefulWidget {
  const PageWelcome({Key? key}) : super(key: key);

  @override
  State<PageWelcome> createState() => _PageWelcomeState();
}

class _PageWelcomeState extends State<PageWelcome> {
  late List<LanguageItemModel> languageItems;
  final CustomPopupMenuController _controller = CustomPopupMenuController();

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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: ScreenUtil.instance.statusBarHeight,
        ),
        child: Column(
          children: [
            _buildLanguageBtn(),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_logo.png',
                    width: 120,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.current.welcome_desc,
                    style: const TextStyle(
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomButton(
                    width: double.infinity,
                    text: Text(
                      S.current.sign_up,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    clickCallback: () {
                      Navigator.pushNamed(context, pageNav);
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButton(
                    width: double.infinity,
                    text: Text(
                      S.current.sign_in,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff465DA9),
                      ),
                    ),
                    isOutline: true,
                    clickCallback: () {
                      _login();
                      // Navigator.pushNamed(context, pageNav);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
                    style: const TextStyle(color: Color(0xff333333)),
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

  void _login() {
    launchDataLoad(() async {
      LoginApplyResp applyResp = await UserManagerService()
          .loginApply(LoginApplyReq(mobile: '13184529326', gsmCode: '86'));

      LoginConfirmResp loginConfirmResp =
          await UserManagerService().loginConfirm(LoginConfirmReq(
        authCode: '155594',
        authId: applyResp.authId,
        mobile: '13184529326',
      ));

      Boxes.userSecretConfigBox
          .put(ConfigKey.ACCESS_TOKEN, loginConfirmResp.token);
      Boxes.userSecretConfigBox
          .put(ConfigKey.ACCESS_UID, loginConfirmResp.customerNo);
    });
  }
}

class LanguageItemModel {
  String? title;
  Image? icon;
  String? value;

  LanguageItemModel({this.title, this.icon, this.value});
}
