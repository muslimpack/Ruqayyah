import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia.dart';
import 'package:ruqayyah/src/features/home/data/repository/ruki_db_helper.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/adab_screen.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/rukia_viewer_screen.dart';
import 'package:ruqayyah/src/features/settings/presentation/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
    rukias = await sl<RukiaDBHelper>().getAllRukiaBook();

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
              RukiaViewerScreen(
                rukias: rukias.where((e) => e.almujaza == 1).toList(),
                title: S.of(context).shortRukia,
              ),
            if (isLoading)
              const SizedBox()
            else
              RukiaViewerScreen(
                rukias: rukias.where((e) => e.almutawasita == 1).toList(),
                title: S.of(context).mediumRukia,
              ),
            if (isLoading)
              const SizedBox()
            else
              RukiaViewerScreen(
                rukias: rukias.where((e) => e.almutawala == 1).toList(),
                title: S.of(context).longRukia,
              ),
            const SettingsScreen(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: kAppMainColor,
          shadowColor: kAppMainColor,
          items: [
            TabItem(
              icon: Icons.question_mark,
              title: S.of(context).ruqyahEtiquette,
            ),
            TabItem(
              icon: Icons.short_text,
              title: S.of(context).shortRukiaShort,
            ),
            TabItem(
              icon: Icons.short_text,
              title: S.of(context).mediumRukiaShort,
            ),
            TabItem(
              icon: Icons.short_text,
              title: S.of(context).longRukiaShort,
            ),
            TabItem(icon: Icons.settings, title: S.of(context).settings),
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
