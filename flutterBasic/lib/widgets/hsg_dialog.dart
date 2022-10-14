import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/http/model/transfer/user_card_list.dart';
import 'package:one_pay/utils/format_util.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/screen_size_fit.dart';

/// 显示设定圆角的底部对话框，需要和内部widget配合使用，内部也需要设置相同圆角，如：BottomMenu
Future showHsgBottomSheet<T>({
  required BuildContext context,
  required WidgetBuilder builder,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder shape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  ),
  Clip? clipBehavior,
  Color? barrierColor,
  bool isScrollControlled = false,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
}) =>
    showModalBottomSheet(
      context: context,
      builder: builder,
      backgroundColor: backgroundColor,
      elevation: elevation,
      shape: shape,
      clipBehavior: clipBehavior,
      barrierColor: barrierColor,
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      routeSettings: routeSettings,
    );

//账户单选底部圆角弹窗
// ignore: must_be_immutable
class HsgBottomSingleChoice extends StatelessWidget {
  final String? title;
  final List<BankCard>? items;
  final List<String>? icons;
  int lastSelectedPosition;

  // ignore: use_key_in_widget_constructors
  HsgBottomSingleChoice({
    Key? key,
    this.title,
    required this.items,
    this.icons,
    this.lastSelectedPosition = -1,
  });

  @override
  Widget build(BuildContext context) {
    Widget? titleWidget;
    Widget? contentWidget;
    Widget? otherCard;
    if (title != null) {
      titleWidget = _titleCloseWidget(title!,
          titlePadding: const EdgeInsets.all(15),
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: HsgColors.color190039),
          context: context);
    }
    //中间部分
    EdgeInsets contentPadding = const EdgeInsets.fromLTRB(0, 0, 0, 0);
    contentWidget = Padding(
      padding: contentPadding,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items!.length + 1,
        itemBuilder: (BuildContext context, int position) {
          if (position <= items!.length - 1) {
            return _getItemOneRow(position, context, lastSelectedPosition);
          } else {
            return otherCard!;
          }
        },
      ),
    );

    //其他卡的选项
    otherCard = InkWell(
        onTap: () {
          lastSelectedPosition = items!.length;
          (context as Element).markNeedsBuild();
          Navigator.of(context).pop(lastSelectedPosition);
        },
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const Image(
                  width: 30,
                  height: 30,
                  image: AssetImage('assets/images/transfer/other_card.png')),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                  width: AutoSizeFit.screenWidth! - 85,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        S.current.transfer_next_card,
                        style: const TextStyle(
                            color: HsgColors.color190039, fontSize: 14),
                      ),
                      const Image(
                          width: 18,
                          height: 18,
                          image: AssetImage('assets/images/transfer/more.png')),
                    ],
                  ))
            ],
          ),
        ));

    List<Widget> columnChildren = <Widget>[
      if (title != null) titleWidget!,
      Flexible(
        child: contentWidget,
      ),
      // otherCard,
    ];

    final dialogChild = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: columnChildren,
    );

    return Ink(
      child: dialogChild,
      height: AutoSizeFit.screenHeight! * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
    );
  }

  Widget _titleCloseWidget(String title,
      {EdgeInsets titlePadding = const EdgeInsets.all(20.0),
      TextStyle style = const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: HsgColors.color190039),
      required BuildContext context}) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: MediaQuery.of(context).size.width - 60,
              child: Text(
                title,
                style: style,
                textAlign: TextAlign.center,
              ),
            ),
            InkWell(
              child: Image(
                width: AutoSizeFit.setPx(15),
                height: AutoSizeFit.setPx(15),
                image: const AssetImage('assets/images/transfer/close.png'),
              ),
              onTap: () {
                Navigator.of(context).pop(false);
              },
            )
          ],
        ));
  }

//创建钱包的栏位
  Widget _getItemOneRow(
      int position, BuildContext context, int selectedPosition) {
    BankCard _itemModel = items![position];
    return InkWell(
      child: Container(
        height: 70,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
              width: 30,
              height: 30,
              image: AssetImage(position == 0
                  ? 'assets/images/transfer/wallet.png'
                  : 'assets/images/transfer/transfer_bank.png')),
          const SizedBox(
            width: 15,
          ),
          position == 0
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 69,
                          alignment: Alignment.center,
                          width: AutoSizeFit.screenWidth! - 115,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  S.current.transfer_wallet_text,
                                  style: const TextStyle(
                                      color: HsgColors.color190039,
                                      fontSize: 16),
                                ),
                                Text(
                                  FormatUtil.formatSringToMoney(
                                      _itemModel.bankAccountNo ?? '0'),
                                  style: const TextStyle(
                                      color: HsgColors.color190039,
                                      fontSize: 14),
                                ),
                              ]),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: AutoSizeFit.screenWidth! - 115,
                      color: HsgColors.colorf2f2f2,
                    )
                  ],
                )
              : SizedBox(
                  height: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        _itemModel.bankName ?? '',
                        style: const TextStyle(
                            color: HsgColors.color190039, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: AutoSizeFit.screenWidth! - 115,
                              child: Column(
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          S.current.transfer_card_type,
                                          style: const TextStyle(
                                              color: HsgColors.color878787,
                                              fontSize: 14),
                                        ),
                                        Text(
                                          FormatUtil.hideNumber(
                                              _itemModel.bankAccountNo!),
                                          style: const TextStyle(
                                              color: HsgColors.color190039,
                                              fontSize: 14),
                                        ),
                                      ]),
                                  Container(
                                    margin: const EdgeInsets.only(top: 11),
                                    height: 1,
                                    width: AutoSizeFit.screenWidth! - 115,
                                    color: HsgColors.colorf2f2f2,
                                  )
                                ],
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Image.asset(
              position == selectedPosition
                  ? 'assets/images/transfer/icon_checked.png'
                  : 'assets/images/transfer/icon_check.png',
              height: 18,
              width: 18,
            ),
          ),
        ]),
      ),
      onTap: () {
        lastSelectedPosition = position;
        (context as Element).markNeedsBuild();
        Navigator.of(context).pop(position);
      },
    );
  }
}
