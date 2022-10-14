import 'package:flutter/cupertino.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

class WithdrawHomePage extends StatefulWidget {
  const WithdrawHomePage({Key? key}) : super(key: key);

  @override
  State<WithdrawHomePage> createState() => _WithdrawHomePageState();
}

class _WithdrawHomePageState extends State<WithdrawHomePage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text(S.current.home_withdraw_text),
      ),
      body: Container(),
    );
  }
}
