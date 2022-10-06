import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageContianer extends StatefulWidget {
  const PageContianer({Key? key}) : super(key: key);

  @override
  State<PageContianer> createState() => _PageContianerState();
}

class _PageContianerState extends State<PageContianer> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Container'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60.0, left: 100.0),
              constraints: const BoxConstraints.tightFor(
                width: 160.0,
                height: 120.0,
              ), //卡片大小
              decoration: const BoxDecoration(
                //背景装饰
                gradient: LinearGradient(
                  //背景线性渐变
                  colors: [
                    Colors.blueAccent,
                    Color(0xff465DA9),
                    Colors.blue,
                  ],
                  stops: [0, 0.6, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                boxShadow: [
                  //卡片阴影
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(2.0, 2.0),
                    blurRadius: 4.0,
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              transform: Matrix4.rotationZ(.3), //卡片倾斜变换
              alignment: Alignment.center, //卡片内文字居中
              child: const Text(
                //卡片文字
                'Container',
                style: TextStyle(color: Colors.white, fontSize: 30.0),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
