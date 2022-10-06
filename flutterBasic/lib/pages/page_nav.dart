import 'package:flutter/material.dart';
import 'package:flutter_basic/pages/page_app_bar.dart';
import 'package:flutter_basic/pages/page_icon.dart';
import 'package:flutter_basic/pages/page_image.dart';
import 'package:flutter_basic/pages/page_scaffold.dart';
import 'package:flutter_basic/pages/page_text.dart';
import 'package:flutter_basic/widgets/custom_app_bar.dart';
import 'package:flutter_basic/widgets/custom_scaffold.dart';

class PageNav extends StatefulWidget {
  const PageNav({Key? key}) : super(key: key);

  @override
  State<PageNav> createState() => _PageNavState();
}

class _PageNavState extends State<PageNav> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        title: const Text('Page Nav'),
      ),
      body: ListView(
        children: [
          _buildListItem(
            context: context,
            name: 'Scaffold',
            icon: Icons.article_outlined,
            page: const PageScaffold(),
          ),
          _buildListItem(
            context: context,
            name: 'AppBar',
            icon: Icons.view_stream,
            page: const PageAppBar(),
          ),
          _buildListItem(
            context: context,
            name: 'Text',
            icon: Icons.title,
            page: const PageText(),
          ),
          _buildListItem(
            context: context,
            name: 'Image',
            icon: Icons.image,
            page: const PageImage(),
          ),
          _buildListItem(
            context: context,
            name: 'Icon',
            icon: Icons.star_rate,
            page: const PageIcon(),
          ),
        ],
      ),
    );
  }

  Column _buildListItem(
      {required String name,
      required BuildContext context,
      required IconData icon,
      required Widget page}) {
    return Column(
      children: [
        ListTile(
          title: Text(name),
          leading: Icon(
            icon,
            color: const Color(0xff2D4699),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
        ),
        const Divider(
          color: Colors.grey,
        )
      ],
    );
  }
}
