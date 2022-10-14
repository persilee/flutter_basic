import 'package:flutter/material.dart';
import 'package:one_pay/generated/l10n.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

class UserNewCardPage extends StatefulWidget {
  const UserNewCardPage({Key? key}) : super(key: key);

  @override
  State<UserNewCardPage> createState() => _UserNewCardPageState();
}

class _UserNewCardPageState extends State<UserNewCardPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: Text(S.current.transfer_next_card),
      ),
      body: Container(),
    );
  }
}
