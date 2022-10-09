import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

class PageAppBar extends StatefulWidget {
  const PageAppBar({Key? key}) : super(key: key);

  @override
  State<PageAppBar> createState() => _PageAppBarState();
}

class _PageAppBarState extends State<PageAppBar> {
  String _selected = '';

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('App Bar'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_outlined),
          tooltip: MaterialLocalizations.of(context).backButtonTooltip,
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
        actions: <Widget>[
          // 非隐藏的菜单
          IconButton(
              icon: const Icon(Icons.add_alarm),
              tooltip: 'Add Alarm',
              onPressed: () {}),
          // 隐藏的菜单
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              _selectView(Icons.message, 'Message', 'A'),
              _selectView(Icons.group_add, 'Service', 'B'),
              _selectView(Icons.cast_connected, 'QRCode', 'C'),
            ],
            onSelected: (String action) {
              // 点击选项的时候
              setState(() {
                _selected = 'Selected $action';
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          _selected == '' ? 'This is body' : _selected,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  _selectView(IconData icon, String text, String id) {
    return PopupMenuItem<String>(
        value: id,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(icon, color: Colors.blue),
            Text(text),
          ],
        ));
  }
}
