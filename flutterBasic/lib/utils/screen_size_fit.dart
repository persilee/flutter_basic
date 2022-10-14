import 'package:flutter/material.dart';

class AutoSizeFit {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? rpx;
  static double? px;
  static double? statusBarHeight; //状态栏高度
  static double? appBarHeight; //导航栏高度
  static double? bottomStatusBarHeight; //刘海屏底部状态栏高度
  static double? autoByWidth; //通过宽度自适应
  static double? autoByHight; //通过高度自适应

  static void initialize(BuildContext context, {double standardWidth = 750}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    rpx = screenWidth! / standardWidth;
    px = screenWidth! / standardWidth * 2;
    statusBarHeight = MediaQuery.of(context).padding.top;
    appBarHeight = AppBar().preferredSize.height;

    autoByWidth = screenWidth! / 375;
    autoByHight = screenHeight! / 812;

    EdgeInsets padding = _mediaQueryData!.padding
        .copyWith(bottom: _mediaQueryData!.viewPadding.bottom);
    bottomStatusBarHeight = padding.bottom;
  }

  // 匹配设计图自适应大小
  static double setAutoByWidth(double size) {
    return AutoSizeFit.autoByWidth! * size;
  }

  // 匹配设计图自适应大小
  static double setAutoByHight(double size) {
    return AutoSizeFit.autoByHight! * size;
  }

  // 按照像素来设置
  static double setPx(double size) {
    return AutoSizeFit.rpx! * size * 2;
  }

  // 按照rxp来设置
  static double setRpx(double size) {
    return AutoSizeFit.rpx! * size;
  }
}
