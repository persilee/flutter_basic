import 'package:flutter/material.dart';

class PageCoffee extends StatefulWidget {
  const PageCoffee({Key? key}) : super(key: key);

  @override
  State<PageCoffee> createState() => _PageCoffeeState();
}

class _PageCoffeeState extends State<PageCoffee> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Coffee Page'),
      ),
    );
  }
}
