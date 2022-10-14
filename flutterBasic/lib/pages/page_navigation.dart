import 'dart:io';

import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/pages/demos/page_nav.dart';
import 'package:one_pay/pages/home/page_home.dart';
import 'package:one_pay/pages/profile/page_profile.dart';

import '../utils/hsg_colors.dart';

class PageNavigation extends StatefulWidget {
  const PageNavigation({Key? key}) : super(key: key);

  @override
  State<PageNavigation> createState() => _PageNavigationState();
}

class _PageNavigationState extends State<PageNavigation> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F4FF),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          PageHome(),
          PageNav(),
          PageProfile(),
        ],
        onPageChanged: (page) {},
      ),
      bottomNavigationBar: _bottomAppBar(),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      elevation: 0,
      notchMargin: 0,
      color: const Color(0xFFF1F4FF),
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: Platform.isAndroid ? 20 : 0,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
        height: 54,
        decoration: const BoxDecoration(
          color: HsgColors.themeOPColor,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildBottomAppBarItem(
                index: 0,
                name: S.current.navigation_wallet,
                icon: _currentIndex == 0
                    ? 'assets/images/navigation/icon_wallet_active.png'
                    : 'assets/images/navigation/icon_wallet.png'),
            _buildBottomAppBarItem(
                index: 1,
                name: S.current.navigation_coffee,
                icon: _currentIndex == 1
                    ? 'assets/images/navigation/icon_service_active.png'
                    : 'assets/images/navigation/icon_service.png'),
            _buildBottomAppBarItem(
                index: 2,
                name: S.current.navigation_profile,
                icon: _currentIndex == 2
                    ? 'assets/images/navigation/icon_profile_active.png'
                    : 'assets/images/navigation/icon_profile.png'),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomAppBarItem(
      {required int index, required String name, required String icon}) {
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
          _pageController.animateToPage(_currentIndex,
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 160));
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
        decoration: BoxDecoration(
          color: _currentIndex == index ? Colors.white : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            _currentIndex == index
                ? Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 12,
                        color: HsgColors.themeOPColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
