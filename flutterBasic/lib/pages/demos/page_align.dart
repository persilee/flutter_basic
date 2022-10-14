import 'package:flutter/material.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

class PageAlign extends StatefulWidget {
  const PageAlign({Key? key}) : super(key: key);

  @override
  State<PageAlign> createState() => _PageAlignState();
}

class _PageAlignState extends State<PageAlign> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Align'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 120.0,
              width: 120.0,
              color: Colors.blue.shade50,
              child: const Align(
                alignment: Alignment.topRight,
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.lightBlue.shade50,
              child: const Align(
                widthFactor: 2,
                heightFactor: 2,
                alignment: Alignment(2, 0.0),
                child: FlutterLogo(
                  size: 60,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
