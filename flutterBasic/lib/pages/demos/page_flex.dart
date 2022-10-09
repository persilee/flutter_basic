import 'package:flutter/material.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

class PageFlex extends StatefulWidget {
  const PageFlex({Key? key}) : super(key: key);

  @override
  State<PageFlex> createState() => _PageFlexState();
}

class _PageFlexState extends State<PageFlex> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Flex And Expanded'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: <Widget>[
            //Flex的两个子widget按1：2来占据水平空间
            Flex(
              direction: Axis.horizontal,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                border: Border.all(
                  width: 1,
                  color: Colors.grey,
                  style: BorderStyle.solid,
                ),
              ),
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 100.0,
                //Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 30.0,
                        color: Colors.lightBlue,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 130.0,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
