// Copyright (c) 2021 深圳高阳寰球科技有限公司
// 新UI按钮
// Author: zhangqirong
// Date: 2021-12-16

import 'package:flutter/material.dart';
import 'package:one_pay/utils/hsg_colors.dart';

class CustomNewButton extends StatelessWidget {
  final double height;
  final String? text;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry? borderRadius;
  final void Function()? onPressed;
  final bool enable;
  final Color? btnColor;
  final double fontSize;
  final Color? borderColor;
  final double? borderWidth;

  const CustomNewButton(
      {Key? key,
      this.height = 55.0,
      this.text,
      this.margin,
      this.borderRadius,
      this.onPressed,
      this.enable = true,
      this.btnColor,
      this.fontSize = 16,
      this.borderColor,
      this.borderWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _isClick = false;

    return AnimatedContainer(
      width: double.infinity,
      height: height,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 360),
      margin: margin ?? const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
          color: enable
              ? btnColor ?? HsgColors.themeOPColor
              : HsgColors.colorFFD778,
          borderRadius: borderRadius ?? BorderRadius.circular(10.0),
          border: Border.all(
              color: borderColor ?? HsgColors.cleanColor,
              width: borderWidth ?? 0)),
      child: ElevatedButton(
        onPressed: (enable && !_isClick)
            ? () {
                _isClick = true;
                onPressed!();
                Future.delayed(const Duration(milliseconds: 300), () {
                  _isClick = false;
                });
              }
            : null,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5.0),
          ),
        ),
        child: Text(
          text ?? 'Button',
          style: TextStyle(
              fontSize: fontSize,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              height: 1),
        ),
      ),
    );
  }
}
