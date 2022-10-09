import 'package:flutter/material.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

class PageStack extends StatefulWidget {
  const PageStack({Key? key}) : super(key: key);

  @override
  State<PageStack> createState() => _PageStackState();
}

class _PageStackState extends State<PageStack> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Stack And Positioned'),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
          children: <Widget>[
            Container(
              child: const Text(
                "Hello world",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
            ),
            const Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            const Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
