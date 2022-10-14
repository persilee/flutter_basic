import 'package:flutter/material.dart';
import 'package:one_pay/pages/demos/page_nav.dart';
import 'package:one_pay/pages/login/page_login.dart';
import 'package:one_pay/pages/otp/page_otp.dart';
import 'package:one_pay/pages/page_navigation.dart';
import 'package:one_pay/pages/transfer/page_new_card.dart';
import 'package:one_pay/pages/page_welcome.dart';
import 'package:one_pay/pages/receive_payment/page_payment.dart';
import 'package:one_pay/pages/register/page_register.dart';
import 'package:one_pay/pages/register/page_register_terms.dart';
import 'package:one_pay/pages/transfer/page_scan_code.dart';
import 'package:one_pay/pages/transfer/page_transfer_home.dart';
import 'package:one_pay/pages/transfer/page_transfer_input.dart';
import 'package:one_pay/pages/transfer/page_transfer_result.dart';
import 'package:one_pay/pages/withdraw_topup/topup/topup_home.dart';
import 'package:one_pay/pages/withdraw_topup/withdraw/withdraw_home.dart';

import '../pages/profile/page_personal_data.dart';
import '../pages/transfer/page_transfer_home.dart';
import '../pages/transfer/page_transfer_input.dart';

import '../pages/transfer/page_transfer_home.dart';
import '../pages/transfer/page_transfer_input.dart';

const pageNav = '/page_navigation';
const pageWelcome = '/sign_up/page_welcome';
const pageDemosNav = '/demos/page_nav';
const pageReg = '/sign_up/page_register';
const pageTransferHome = '/page_transfer_home.dart';
const pageTransferInputPage = '/page_transfer_input.dart';
const pageTransferResult = '/page_transfer_result.dart';
const pageRegisterTerms = '/page_register_terms.dart';
const pageTransferScanCode = '/page_scan_code.dart';
const PagePersonalData = '/profile/page_personal_data.dart';
const pageUserNewCard = '/page_new_card.dart';
const pageTopUpHome = '/topup_main.dart';
const pageWithdrawHome = '/withdraw_home.dart';

///Receive_Payment
const pagePayment = '/page_payment.dart';

const pageLogin = '/login/page_login';
const pageOtp = '/otp/page_otp';

final appRoutes = {
  pageNav: (context) => const PageNavigation(),
  pageWelcome: (context) => const PageWelcome(),
  pageDemosNav: (context) => const PageNav(),
  pageReg: (context) => const RegisterPage(),
  pageTransferHome: (context) => const OPTransferHomePage(),
  pageTransferResult: (context) => const TransferResultPage(),
  pageRegisterTerms: (context) => const RegisterTermsPage(),
  pageLogin: (context) => const PageLogin(),
  pageTransferScanCode: (context) => const TransferScanCodePage(),

  ///Receive_Payment
  pagePayment: (context) => const PaymentPage(),

  PagePersonalData: (context) => const PersonalDataPage(),
  pageUserNewCard: (context) => const UserNewCardPage(),
  pageTopUpHome: (context) => const TopUpHomePage(),
  pageWithdrawHome: (context) => const WithdrawHomePage(),
};

onGenerateRoute(RouteSettings settings) {
  // if (settings.name == pageNav) {
  //   return MaterialPageRoute(builder: (context) {
  //     Map map = settings.arguments as Map;
  //     return const PageNav();
  //   });
  // }
  ///校验PIN页面（待详情的，非弹窗）
  if (settings.name == pageOtp) {
    return MaterialPageRoute(builder: (context) {
      Map<String, dynamic> arguments =
          settings.arguments as Map<String, dynamic>;
      return PageOtp(
        userPhone: arguments['userPhone'],
        type: arguments['type'],
      );
    });
  }
  if (settings.name == pageTransferInputPage) {
    return MaterialPageRoute(builder: (context) {
      // TransOnePayAccountResp arguments =
      //     settings.arguments as TransOnePayAccountResp;
      Map<String, dynamic> arguments =
          settings.arguments as Map<String, dynamic>;
      return TransferInputInfomationPage(
        userData: arguments['userData'],
      );
    });
  }

  return null;
}
