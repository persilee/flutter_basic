// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

class RegisterTermsPage extends StatefulWidget {
  const RegisterTermsPage({Key? key}) : super(key: key);

  @override
  State<RegisterTermsPage> createState() => _RegisterTermsPageState();
}

class _RegisterTermsPageState extends State<RegisterTermsPage> {
  final TextEditingController? _accountText = TextEditingController();
  final FocusNode? _accountFocusNode = FocusNode();
  bool enableNext = false;

  @override
  void initState() {
    super.initState();
    _accountFocusNode!.addListener(() {
      if (!_accountFocusNode!.hasFocus) {
        if (_accountText!.text.isNotEmpty) {
          setState(() {
            enableNext = true;
          });
        } else {
          setState(() {
            enableNext = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: CustomAppBar(
          title: const Text("Terms and Conditions"),
        ),
        // TODO
        body: const SizedBox());
  }
}
