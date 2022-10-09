import 'package:flutter/material.dart';
import 'package:OnePay/pages/demos/page_nav.dart';
import 'package:OnePay/pages/page_navigation.dart';
import 'package:OnePay/pages/sign_up/page_welcome.dart';

const pageNav = '/page_navigation';
const pageWelcome = '/sign_up/page_welcome';
const pageDemosNav = '/demos/page_nav';

final appRoutes = {
  pageNav: (context) => const PageNavigation(),
  pageWelcome: (context) => const PageWelcome(),
  pageDemosNav: (context) => const PageNav(),
};

onGenerateRoute(RouteSettings settings) {
  // if (settings.name == pageNav) {
  //   return MaterialPageRoute(builder: (context) {
  //     Map map = settings.arguments as Map;
  //     return const PageNav();
  //   });
  // }

  return null;
}
