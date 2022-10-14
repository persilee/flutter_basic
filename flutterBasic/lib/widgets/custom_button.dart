import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../utils/hsg_colors.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? text;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;
  final bool? isOutline;
  final Color? outlineColor;
  final VoidCallback? clickCallback;
  final bool? isEnable;
  final bool? isLoading;
  final Color? forbidColor;

  const CustomButton(
      {Key? key,
      this.height = 44.0,
      this.width = 200.0,
      this.text,
      this.margin,
      this.color = HsgColors.themeOPColor,
      this.borderRadius,
      this.isOutline = false,
      this.outlineColor = HsgColors.themeOPColor,
      this.clickCallback,
      this.isEnable = true,
      this.isLoading = false,
      this.forbidColor = HsgColors.colorFFD778})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 360),
      height: height,
      width: width,
      margin: margin ?? const EdgeInsets.fromLTRB(16, 8, 16, 8),
      decoration: isEnable!
          ? BoxDecoration(
              color: isOutline! ? Colors.transparent : color,
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
            )
          : BoxDecoration(
              color: forbidColor,
              borderRadius: borderRadius ?? BorderRadius.circular(5.0),
            ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(5.0),
          ),
          primary: Colors.transparent, // 设为透明色
          // onPrimary: Colors.blue.withOpacity(0),
          elevation: 1, // 正常时阴影隐藏
          shadowColor: Colors.transparent,
          minimumSize: const Size(96, 44),
          side: isOutline!
              ? BorderSide(
                  color: isEnable!
                      ? outlineColor!
                      : outlineColor!, //.withOpacity(0.3),
                  width: 1)
              : const BorderSide(color: Colors.transparent, width: 0),
        ),
        onPressed: isEnable! ? clickCallback ?? () {} : null,
        child: isLoading!
            ? LayoutBuilder(builder: (context, constraints) {
                if (kDebugMode) {
                  print(constraints.maxHeight);
                }
                return SizedBox(
                  width: constraints.maxHeight / 2,
                  height: constraints.maxHeight / 2,
                  child: CircularProgressIndicator(
                    valueColor:
                        const AlwaysStoppedAnimation<Color>(Color(0xff3394D4)),
                    backgroundColor: const Color(0xff3394D4).withOpacity(0.6),
                    strokeWidth: 1.0,
                  ),
                );
              })
            : Container(
                alignment: Alignment.center,
                child: text ??
                    Text(
                      'button',
                      style: TextStyle(
                          color: isOutline!
                              ? (isEnable!
                                  ? const Color(0xff465DA9)
                                  : HsgColors.colorFFD778)
                              : HsgColors.colorffffff,
                          fontSize: 14.0),
                    ),
              ),
      ),
    );
  }
}
