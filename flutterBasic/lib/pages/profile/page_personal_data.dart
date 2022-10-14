import 'package:flutter/material.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

import '../../generated/l10n.dart';
import '../../widgets/custom_app_bar.dart';

class PersonalDataPage extends StatefulWidget {
  final String? accountText;

  const PersonalDataPage({Key? key, this.accountText}) : super(key: key);

  @override
  State<PersonalDataPage> createState() => _PersonalDataPageState();
}

class _PersonalDataPageState extends State<PersonalDataPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dataArgument = ModalRoute.of(context)!.settings.arguments;
    if (dataArgument != null) {
      //这里应该是可以拿到账户和名称的
    }
    return CustomScaffold(
        scaffodContainColor: HsgColors.colorF5F7FD,
        topHeight: 148,
        appBar: CustomAppBar(
          title: Text(S.current.user_profile),
        ),
        body: Column(children: [
          Center(
            child: Container(
              color: HsgColors.colorffffff,
              margin: const EdgeInsets.only(top: 30),
              height: (ScreenUtil.instance.screenWidth - 40) * 200 / 339,
              width: ScreenUtil.instance.screenWidth - 40,
              child: Column(
                children: [
                  _buildHomeItem(
                    image: 'assets/images/profile/head-portrait.png',
                    name: S.current.my_cards,
                  ),
                  const Divider(height: 1, indent: 15, endIndent: 15),
                  _buildHomeItem(
                    image: 'assets/images/profile/id-information.png',
                    name: S.current.id_certification,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ]));
  }

  Widget _buildHomeItem({required String image, required String name}) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: ScreenUtil.instance.screenWidth - 40,
        height: 50,
        color: HsgColors.cleanColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 54),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      width: 36,
                      height: 36,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                const SizedBox(width: 11.67),
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xff190039),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 19.34),
              child: Image.asset(
                'assets/images/profile/more.png',
                width: 8,
                height: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
