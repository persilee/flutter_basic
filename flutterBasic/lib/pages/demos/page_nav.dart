import 'package:flutter/material.dart';
import 'package:OnePay/pages/demos/page_align.dart';
import 'package:OnePay/pages/demos/page_app_bar.dart';
import 'package:OnePay/pages/demos/page_button.dart';
import 'package:OnePay/pages/demos/page_column.dart';
import 'package:OnePay/pages/demos/page_container.dart';
import 'package:OnePay/pages/demos/page_flex.dart';
import 'package:OnePay/pages/demos/page_icon.dart';
import 'package:OnePay/pages/demos/page_image.dart';
import 'package:OnePay/pages/demos/page_scaffold.dart';
import 'package:OnePay/pages/demos/page_stack.dart';
import 'package:OnePay/pages/demos/page_text.dart';
import 'package:OnePay/widgets/custom_app_bar.dart';
import 'package:OnePay/widgets/custom_scaffold.dart';

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
          _buildListItem(
            context: context,
            name: 'Button',
            icon: Icons.videogame_asset,
            page: const PageButton(),
          ),
          _buildListItem(
            context: context,
            name: 'Container',
            icon: Icons.airplay,
            page: const PageContianer(),
          ),
          _buildListItem(
            context: context,
            name: 'Align',
            icon: Icons.format_indent_increase,
            page: const PageAlign(),
          ),
          _buildListItem(
            context: context,
            name: 'Column And Row',
            icon: Icons.settings_overscan,
            page: const PageColumnRow(),
          ),
          _buildListItem(
            context: context,
            name: 'Flex And Expanded',
            icon: Icons.vertical_split,
            page: const PageFlex(),
          ),
          _buildListItem(
            context: context,
            name: 'Stack And Positioned',
            icon: Icons.view_carousel,
            page: const PageStack(),
          ),
          const SizedBox(
            height: 20.0,
          )
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
