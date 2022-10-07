import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageColumnRow extends StatefulWidget {
  const PageColumnRow({Key? key}) : super(key: key);

  @override
  State<PageColumnRow> createState() => _PageColumnRowState();
}

class _PageColumnRowState extends State<PageColumnRow> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Column And Row'),
      ),
      body: Column(
        //测试Row对齐方式，排除Column默认居中对齐的干扰
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Container(
            color: Colors.lightBlue,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            textDirection: TextDirection.rtl,
            children: const [
              Text(" hello world "),
              Text(" I am Jack "),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            verticalDirection: VerticalDirection.up,
            children: const [
              Text(
                " hello world ",
                style: TextStyle(fontSize: 30.0),
              ),
              Text(
                " I am Jack ",
              ),
            ],
          ),
        ],
      ),
    );
  }
}
