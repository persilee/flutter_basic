import 'package:flutter/material.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

class PageImage extends StatefulWidget {
  const PageImage({Key? key}) : super(key: key);

  @override
  State<PageImage> createState() => _PageImageState();
}

class _PageImageState extends State<PageImage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Image'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text(
              'Asset Image',
              style: TextStyle(color: Colors.black),
            ),
            Image.asset(
              'assets/images/icon_logo.png',
              height: 60,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Network Image',
              style: TextStyle(color: Colors.black),
            ),
            Image.network(
              'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg-blog.csdnimg.cn%2Fimg_convert%2Fa092a42776106d7e76e867d590b971f0.png&refer=http%3A%2F%2Fimg-blog.csdnimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1667644561&t=2d2aab95f8017f8060e82ce58a72166d',
              width: 300.0,
            )
          ],
        ),
      ),
    );
  }
}
