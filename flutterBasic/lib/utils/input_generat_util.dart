//新UI输入框
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_pay/utils/format_text_util.dart';
import 'package:one_pay/utils/hsg_colors.dart';
import 'package:one_pay/utils/money_text_input_formatter.dart';
import 'package:one_pay/utils/screen_size_fit.dart';

class NewTranferInputWidget extends StatelessWidget {
  final String title;
  final double? height;
  final double? textFieldHeight;
  final String? hintText;
  final Widget? widget;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final Function(String)? callback;
  final bool isWidget;
  final int length;
  final bool isRegEXp;
  final String? regExp;
  final bool isUpperCase;
  final bool isMoney;
  final bool enabled;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? margin;
  final int maxLines;
  final bool isCustomInputFormatters;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? bottomWidget;
  final bool isBottomWidget;

  const NewTranferInputWidget(
      {Key? key,
      required this.title,
      this.hintText,
      this.height,
      this.textFieldHeight,
      this.widget,
      this.keyboardType,
      this.controller,
      this.callback,
      this.isWidget = false,
      this.length = 140,
      this.isRegEXp = false,
      this.regExp,
      this.isUpperCase = false,
      this.isMoney = false,
      this.enabled = true,
      this.focusNode,
      this.margin,
      this.maxLines = 1,
      this.isCustomInputFormatters = false,
      this.inputFormatters,
      this.isBottomWidget = false,
      this.bottomWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    AutoSizeFit.initialize(context);
    return Container(
      margin:
          margin ?? const EdgeInsets.only(top: 10, left: 14, right: 14), //四周距离
      height: height ?? AutoSizeFit.setPx(100 + 20.0 * (maxLines - 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              title != ''
                  ? Text(
                      //标题
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: HsgColors.color190039,
                        fontSize: 14,
                      ),
                    )
                  : Container(),
              //isWidget变量冲突，不知道用来干嘛的，先注释
              // isWidget ? widget : Container(),
            ],
          ),
          Container(
              height: textFieldHeight ??
                  AutoSizeFit.setPx(50.0 + 20.0 * (maxLines - 1)),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: HsgColors.bgColor,
              ),
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.only(left: 15, right: 20),
                    child: TextField(
                      enabled: enabled,
                      controller: controller,
                      focusNode: focusNode,
                      autocorrect: false,
                      autofocus: false,
                      maxLines: maxLines,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: HsgColors.color190039,
                        fontSize: 16,
                      ),
                      keyboardType: keyboardType,
                      decoration: InputDecoration.collapsed(
                        hintText: hintText,
                        hintStyle: const TextStyle(
                            fontSize: 14, color: HsgColors.color878787),
                      ),
                      inputFormatters: isCustomInputFormatters == true
                          ? inputFormatters
                          : <TextInputFormatter>[
                              LengthLimitingTextInputFormatter(length),
                              if (isUpperCase) UpperCaseTextFormatter(),
                              // FilteringTextInputFormatter.deny(
                              //     RegExp(InputFormartterRegExp.REGEX_EMOJI)), //禁止输入emoji
                              if (isMoney) CommaTextInputFormatter(),
                              if (isMoney) MoneyTextInputFormatter(),
                              isRegEXp
                                  ? FilteringTextInputFormatter.allow(
                                      RegExp(regExp ?? ''))
                                  : LengthLimitingTextInputFormatter(length),
                            ],
                      onChanged: (text) {
                        callback!(text);
                      },
                    ),
                  )),
                  isWidget
                      ? Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: widget)
                      : Container(),
                ],
              )),
          isBottomWidget ? bottomWidget! : Container()
        ],
      ),
    );
  }
}
