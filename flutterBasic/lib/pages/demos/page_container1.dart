import 'package:flutter/material.dart';

class PageContianer1 extends StatefulWidget {
  const PageContianer1({Key? key}) : super(key: key);

  @override
  State<PageContianer1> createState() => _PageContianer1State();
}

class _PageContianer1State extends State<PageContianer1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Container'),
        ),
        body: Container(
          height: 120,
          width: 120,
          color: Colors.amber,
          child: Center(
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              print(constraints);
              return const Align(
                alignment: Alignment.bottomRight,
                child: FlutterLogo(
                  size: 60,
                ),
              );
            }),
          ),
        ));
  }
}
