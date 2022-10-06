import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_button.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageButton extends StatefulWidget {
  const PageButton({Key? key}) : super(key: key);

  @override
  State<PageButton> createState() => _PageButtonState();
}

class _PageButtonState extends State<PageButton> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Icon'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("ElevatedButton"),
              onPressed: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              child: const Text("TextButton"),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up, color: Color(0xff2D4699)),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("Send"),
              onPressed: () {},
            ),
            CustomButton(
              width: double.infinity,
              text: const Text(
                'Custom Button',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              clickCallback: () {},
            ),
            const CustomButton(
              width: double.infinity,
              text: Text(
                'Custom Button DisEnable',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              isEnable: false,
            ),
            CustomButton(
              width: double.infinity,
              text: const Text(
                'Custom Outline Button',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff465DA9),
                ),
              ),
              isOutline: true,
              clickCallback: () {},
            ),
            const CustomButton(
              width: double.infinity,
              text: Text(
                'Custom Outline Button DisEnable',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff465DA9),
                ),
              ),
              isOutline: true,
              isEnable: false,
            ),
          ],
        ),
      ),
    );
  }
}
