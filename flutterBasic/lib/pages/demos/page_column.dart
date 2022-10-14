import 'package:flutter/material.dart';
import 'package:one_pay/widgets/custom_app_bar.dart';
import 'package:one_pay/widgets/custom_scaffold.dart';

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
      body: LayoutBuilder(builder: (context, c) {
        return Container(
          color: Colors.blue,
          child: Column(
            //测试Row对齐方式，排除Column默认居中对齐的干扰
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(),
              const FlutterLogo(
                size: 60,
              ),
              Expanded(
                child: ListView(
                  children: [
                    ...List.generate(60, (index) => const Text('text'))
                        .toList(),
                  ],
                ),
              ),
              const FlutterLogo(
                size: 160,
              ),
            ],
          ),
        );
      }),
    );
  }
}
