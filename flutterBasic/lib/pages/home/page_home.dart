import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/routes/routes.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/utils/status_bar_util.dart';

import '../../generated/l10n.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    StatusBarUtil.setStatusBar(SystemUiOverlayStyle.dark);

    final Widget _topInfoWidget = Row(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/home/icon_avatar.png',
            width: 50,
            height: 50,
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to OnePay',
              style: TextStyle(color: HsgColors.color878787.withOpacity(.7)),
            ),
            const Text(
              'Bella',
              style: TextStyle(
                color: HsgColors.color190039,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );

    final Widget _functionWidget = Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_payment.png',
                name: S.current.receive_payment,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_scan.png',
                name: 'Scan',
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_transfer.png',
                name: S.current.transfer_Text,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_transaction.png',
                name: S.current.home_transaction_text,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_topUp.png',
                name: S.current.home_topup_text,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: _buildHomeItem(
                image: 'assets/images/home/icon_withdraw.png',
                name: S.current.home_withdraw_text,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
      ],
    );

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil.instance.statusBarHeight,
          right: 20,
          left: 20,
        ),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil.instance.statusBarHeight + 10),
            _topInfoWidget,
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                //安卓的滑动效果，在ios中体现出不能使用弹簧效果
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/home/bg_banner.png',
                      height: (ScreenUtil.instance.width - 40) *
                          (194 - 6 * 2) /
                          335,
                      width: ScreenUtil.instance.width - 40,
                    ),
                    const SizedBox(height: 15),
                    _functionWidget,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeItem({required String image, required String name}) {
    return InkWell(
      onTap: () {
        if (name == S.current.transfer_Text) {
          //转账
          Navigator.pushNamed(context, pageTransferHome);
        } else if (name == S.current.transfer_scan_text) {
          //扫一扫
          Navigator.pushNamed(context, pageTransferScanCode);
        } else if (name == S.current.home_topup_text) {
          //充值
          Navigator.pushNamed(context, pageTopUpHome);
        } else if (name == S.current.home_withdraw_text) {
          //提现
          Navigator.pushNamed(context, pageWithdrawHome);
        } else if (name == S.current.receive_payment) {
          //收付款
          Navigator.pushNamed(context, pagePayment);
        }
      },
      child: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            Text(
              name,
              style: const TextStyle(
                color: Color(0xFF333333),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
