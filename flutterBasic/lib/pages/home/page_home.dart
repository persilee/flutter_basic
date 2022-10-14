import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/utils/screen_util.dart';
import 'package:flutter_basic/utils/status_bar_util.dart';

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  State<PageHome> createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  @override
  Widget build(BuildContext context) {
    StatusBarUtil.setStatusBar(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: ScreenUtil.instance.screenHeight,
            width: ScreenUtil.instance.screenWidth,
          ),
          Container(
            height: ScreenUtil.instance.screenHeight * 0.6,
            width: ScreenUtil.instance.screenWidth,
            decoration: const BoxDecoration(
              color: Colors.deepOrangeAccent,
              image: DecorationImage(
                image: AssetImage('assets/images/home/bg_home.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: ScreenUtil.instance.screenHeight * 0.4,
              width: ScreenUtil.instance.screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xffF1F4FF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil.instance.statusBarHeight,
              right: 20,
              left: 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: ScreenUtil.instance.screenHeight * 0.6 -
                      80 -
                      62 -
                      ScreenUtil.instance.statusBarHeight,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/home/icon_avatar.png',
                            height: 48,
                            width: 48,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome to OnePay',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              const Text(
                                'Bella',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      Image.asset('assets/images/home/bg_card.png'),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildHomeItem(
                        image: 'assets/images/home/icon_payment.png',
                        name: 'Receive & Payment',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: _buildHomeItem(
                        image: 'assets/images/home/icon_scan.png',
                        name: 'Scan',
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    Expanded(
                      child: _buildHomeItem(
                        image: 'assets/images/home/icon_transfer.png',
                        name: 'Transfer',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: _buildHomeItem(
                        image: 'assets/images/home/icon_transaction.png',
                        name: 'Transaction ',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

<<<<<<< HEAD
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
=======
  Container _buildHomeItem({required String image, required String name}) {
    return Container(
      height: 120,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
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
              color: Color(0xff333333),
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
        ],
>>>>>>> 3c57483220d55d01949d5d891d9759bc147b0aef
      ),
    );
  }
}
