import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

import '../../generated/l10n.dart';
import '../../routes/routes.dart';

class PageProfile extends StatefulWidget {
  final String? accountText;

  const PageProfile({Key? key, this.accountText}) : super(key: key);

  @override
  State<PageProfile> createState() => _PageProfileState();
}

class _PageProfileState extends State<PageProfile> {
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
        body: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, top: 54),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile/head-portrait.png',
                    width: 64,
                    height: 64,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                width: ScreenUtil.instance.screenWidth - 112,
                margin: const EdgeInsets.only(left: 8, right: 20, top: 54),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      // width: ScreenUtil.instance.screenWidth - 10 - 64 - 20 * 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Bella',
                            style: TextStyle(
                              color: HsgColors.colorFFF6E5,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            '134****9008',
                            style: TextStyle(
                              color: HsgColors.colorFFF6E5.withOpacity(0.7),
                              fontSize: 16,
                              fontFamily: 'PingFang SC',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: HsgColors.cleanColor, elevation: 0),
                      onPressed: () {
                        Navigator.pushNamed(context, PagePersonalData);
                      },
                      child: Image.asset(
                        'assets/images/profile/set.png',
                        width: 20,
                        height: 18,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 28, right: 28),
            height: (ScreenUtil.instance.screenWidth - 40) * 200 / 339,
            width: ScreenUtil.instance.screenWidth - 40,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/profile/members-gold.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 55),
                Row(
                  children: [
                    Text(
                      S.current.balance,
                      style: const TextStyle(
                        color: HsgColors.color7B4E21,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/profile/eyes.png',
                      width: 13.97,
                      height: 10.16,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    Text(
                      '120 ACUT',
                      style: TextStyle(
                          color: HsgColors.color7B4E21,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  children: [
                    Text(
                      S.current.available_assets,
                      style: const TextStyle(
                          color: HsgColors.color7B4E21,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 41),
                    Text(
                      S.current.pending,
                      style: const TextStyle(
                          color: HsgColors.color7B4E21,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: const [
                    Text(
                      "120 ACUT",
                      style: TextStyle(
                          color: HsgColors.color7B4E21,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 71),
                    Text(
                      "120 ACUT",
                      style: TextStyle(
                          color: HsgColors.color7B4E21,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
              child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  // height: AutoSizeFit.screenHeight! - 140,
                  child: SingleChildScrollView(
                    //安卓的滑动效果，在ios中体现出不能使用弹簧效果
                    physics: const ClampingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHomeItem(
                                image:
                                    'assets/images/profile/id-information.png',
                                name: S.current.my_cards,
                              ),
                              const Divider(
                                  height: 1, indent: 15, endIndent: 15),
                              _buildHomeItem(
                                image:
                                    'assets/images/profile/id-information.png',
                                name: S.current.id_certification,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHomeItem(
                                image:
                                    'assets/images/profile/password-management.png',
                                name: S.current.password_management,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildHomeItem(
                                image: 'assets/images/profile/about-us.png',
                                name: S.current.about_us,
                              ),
                              const Divider(
                                  height: 1, indent: 15, endIndent: 15),
                              _buildHomeItem(
                                image: 'assets/images/profile/contact-us.png',
                                name: S.current.contact_us,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))),
        ]));
  }

  Widget _buildHomeItem({required String image, required String name}) {
    return InkWell(
      onTap: () {
        if (name == S.current.my_cards) {
          //钱包
          Navigator.pushNamed(context, PagePersonalData);
        } else if (name == S.current.id_certification) {
          Navigator.pushNamed(context, PagePersonalData);
        }
      },
      child: Container(
        width: ScreenUtil.instance.screenWidth - 40,
        height: 50,
        color: HsgColors.cleanColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Image.asset(
                    image,
                    width: 16.67,
                    height: 13.33,
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
