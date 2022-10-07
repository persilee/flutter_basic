import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/page_navigation.dart';

const pageNav = '/pages/page_nav';

final appRoutes = {
  pageNav: (context) => const PageNavigation(),
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
