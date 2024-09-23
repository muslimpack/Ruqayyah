import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
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
        title: const Text(
          "عنا",
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
              "${"تطبيق رقية الإصدار"} $kAppVersion",
            ),
            subtitle: const Text(
              "مجاني وخالي من الإعلانات ومفتوح المصدر",
            ),
          ),
          const Divider(),
          ListTile(
            leading: Icon(MdiIcons.handClap),
            title: const Text(
              "نرجو الدعاء لنا ولوالدينا",
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.menu_book),
            title: const Text(
              "الرقية الشرعية من القرآن الكريم والسنة النبوية",
            ),
            subtitle: const Text(
              "د. خالد بن عبدالرحمن الجريسي",
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
            title: const Text(
              "رابط البرنامج مفتوح المصدر",
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
