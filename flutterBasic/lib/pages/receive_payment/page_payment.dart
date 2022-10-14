import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_size_fit.dart';
import 'package:one_pay/utils/screen_util.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: Text(S.current.payment),
      ),
      scaffodContainColor: HsgColors.colorF5F7FD,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          width: ScreenUtil.instance.screenWidth - 20 * 2,
          height: (ScreenUtil.instance.screenWidth - 20 * 2) / 335 * 377,
          margin: const EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _getTitleWidget(),
              _getQrCodeWidget(),
              _getAccountInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }

  ///title Widget
  Widget _getTitleWidget() {
    /// 内容Widget
    Widget _contentWidget = SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'assets/images/receive_payment/pay_icon.png',
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              S.current.pay_the_merchant,
              style: const TextStyle(
                color: HsgColors.color190039,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              /// TODO 更多点击事件
            },
            child: Container(
              height: 50,
              width: 30,
              alignment: Alignment.centerRight,
              child: Image.asset(
                'assets/images/receive_payment/more.png',
                width: 13,
                height: 3,
              ),
            ),
          )
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          _contentWidget,
          const Divider(
            height: 1,
            color: HsgColors.colorf2f2f2,
          ),
        ],
      ),
    );
  }

  ///二维码
  Widget _getQrCodeWidget() {
    return SizedBox(
      width: AutoSizeFit.setAutoByWidth(170),
      height: AutoSizeFit.setAutoByWidth(170),
      child: QrImage(
        backgroundColor: HsgColors.colorffffff,
        data: '需要通过接口获取二维码',
        padding: EdgeInsets.zero,
        version: QrVersions.auto,
      ),
    );
  }

  ///二维码下面黄色部分的账号信息widget
  Widget _getAccountInfoWidget() {
    double _widthWidget = ScreenUtil.instance.screenWidth - 20 * 2;
    double _paddingWidget = 15;
    double _leftIconWidth = 30;

    ///Content info widget
    Widget _contentInfoWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ABA  Bank',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Row(
          children: const [
            Expanded(
              flex: 1,
              child: Text(
                'Saving Account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                '6214 **** 2124',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                textAlign: TextAlign.right,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );

    /// 中间的信息模块
    Widget _centerInfoWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/receive_payment/acc_icon_wallet.png',
          width: AutoSizeFit.setAutoByWidth(_leftIconWidth),
          height: AutoSizeFit.setAutoByWidth(_leftIconWidth),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width:
              _widthWidget - _paddingWidget * 2 - _leftIconWidth - 10 - 16 - 10,
          child: _contentInfoWidget,
        ),
        const SizedBox(width: 10),
        Image.asset(
          'assets/images/receive_payment/white_drop_down.png',
          width: 16,
          height: 16,
        ),
      ],
    );

    return Container(
      width: _widthWidget,
      height: _widthWidget / 335 * 80,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/receive_payment/payment_sag_bg.png'),
          fit: BoxFit.fill,
        ),
      ),
      padding: EdgeInsets.only(
        left: _paddingWidget,
        right: _paddingWidget,
        top: 25,
      ),
      child: InkWell(
        onTap: () {
          /// TODO 选择账号按钮
          print('选择账号按钮');
        },
        child: _centerInfoWidget,
      ),
    );
  }
}
