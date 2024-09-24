import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/core/functions/open_url.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).aboutUs,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 15),
          ListTile(
            leading: Image.asset(
              'assets/images/logo.png',
              scale: 3,
            ),
            title: Text(
              "${S.of(context).appTitle} ${S.of(context).version} $kAppVersion",
            ),
            subtitle: Text(
              S.of(context).freeAdFreeAndOpenSourceApp,
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(MdiIcons.handClap),
            title: Text(
              S.of(context).prayForUsAndParents,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: Text(
              S.of(context).rukiaBookTitle,
            ),
            subtitle: Text(
              S.of(context).rukiaBookAuthor,
            ),
            onTap: () {
              openURL(
                "https://www.alukah.net/Books/Files/Book_8301/BookFile/rukia.pdf",
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: Icon(MdiIcons.github),
            title: Text(
              S.of(context).github,
            ),
            onTap: () async {
              await openURL(
                'https://github.com/muslimpack/Ruqayyah',
              );
            },
          ),
        ],
      ),
    );
  }
}
