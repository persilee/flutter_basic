import 'package:flutter/material.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

class PageText extends StatefulWidget {
  const PageText({Key? key}) : super(key: key);

  @override
  State<PageText> createState() => _PageTextState();
}

class _PageTextState extends State<PageText> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Text'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Hello world",
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello world! I'm Jack. " * 4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello world",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  height: 1.2,
                  fontFamily: "Courier",
                  background: Paint()..color = Colors.blueAccent,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: "Home: "),
                    TextSpan(
                      text: "https://flutterchina.club",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
