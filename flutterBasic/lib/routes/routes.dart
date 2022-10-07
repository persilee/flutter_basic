import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/page_navigation.dart';
import 'package:flutter_basic/pages/sign_up/page_welcome.dart';

const pageNav = '/page_navigation';
const pageWelcome = '/sign_up/page_welcome';

final appRoutes = {
  pageNav: (context) => const PageNavigation(),
  pageWelcome: (context) => const PageWelcome(),
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
