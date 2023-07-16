import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/src/helpers/book_helper.dart';
import 'package:ruqayyah/src/models/rukia.dart';
import 'package:ruqayyah/src/shared/functions/app_print.dart';
import 'package:ruqayyah/src/views/adab.dart';
import 'package:ruqayyah/src/views/settings.dart';
import 'package:ruqayyah/src/views/viewer.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final PageController _controller;
  late final List<Rukia> rukias;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _getData();
  }

  Future<void> _getData() async {
    try {
      rukias = await rukiaDBHelper.getAll();
    } catch (e) {
      rukias = [];
      appPrint(e);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [
            const AdabScreen(),
            if (isLoading)
              const SizedBox()
            else
              Viewer(
                rukias: rukias.where((e) => e.almujaza == 1).toList(),
                title: "الرقية الموجزة",
              ),
            if (isLoading)
              const SizedBox()
            else
              Viewer(
                rukias: rukias.where((e) => e.almutawasita == 1).toList(),
                title: "الرقية المتوسطة",
              ),
            if (isLoading)
              const SizedBox()
            else
              Viewer(
                rukias: rukias.where((e) => e.almutawala == 1).toList(),
                title: "الرقية المطولة",
              ),
            const SettingsScreen(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: Colors.deepOrange,
          shadowColor: Colors.deepOrange,
          items: const [
            TabItem(icon: Icons.question_mark, title: 'آداب الرقية'),
            TabItem(icon: Icons.short_text, title: 'الموجزة'),
            TabItem(icon: Icons.short_text, title: 'المتوسطة'),
            TabItem(icon: Icons.short_text, title: 'المطولة'),
            TabItem(icon: Icons.settings, title: 'الإعدادات'),
          ],
          onTap: (int i) {
            _controller.animateToPage(
              i,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            setState(() {});
          },
        ),
      ),
    );
  }
}
