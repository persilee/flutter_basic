import 'package:flutter/material.dart';

class PageService extends StatefulWidget {
  const PageService({Key? key}) : super(key: key);

  @override
  State<PageService> createState() => _PageServiceState();
}

class _PageServiceState extends State<PageService> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Service Page'),
      ),
    );
  }
}
