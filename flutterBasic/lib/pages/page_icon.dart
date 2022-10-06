import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageIcon extends StatefulWidget {
  const PageIcon({Key? key}) : super(key: key);

  @override
  State<PageIcon> createState() => _PageIconState();
}

class _PageIconState extends State<PageIcon> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Icon'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(
              height: 10,
            ),
            Icon(Icons.computer, size: 40, color: Color(0xff2D4699)),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.sick, size: 40, color: Color(0xff2D4699)),
            SizedBox(
              height: 10,
            ),
            Icon(Icons.favorite, size: 40, color: Color(0xff2D4699)),
          ],
        ),
      ),
    );
  }
}
