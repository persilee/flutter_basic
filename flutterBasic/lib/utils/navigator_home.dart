// Copyright (c) 2022 深圳高阳寰球科技有限公司
// 抽出-跳转回主页的方法
// Author: zhangqirong
// Date: 2022-01-10

import 'package:flutter/material.dart';
import 'package:one_pay/pages/page_navigation.dart';

void navigatorToHome(BuildContext context) {
  //删除所有页面，跳转进入主页
  Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (BuildContext context) {
      return const PageNavigation();
    }),
    (Route route) => false,
  );
}
