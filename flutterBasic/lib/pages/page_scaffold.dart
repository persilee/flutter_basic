import 'package:flutter/material.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageScaffold extends StatefulWidget {
  const PageScaffold({Key? key}) : super(key: key);

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Page Scaffold'),
      ),
      body: const Center(
        child: Text('This is body.'),
      ),
      drawer: _buildDrawer(context),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(Icons.view_headline_rounded),
        ),
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
