import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/adab_screen.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/ruka_screen.dart';
import 'package:ruqayyah/src/features/settings/presentation/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          children: const [
            AdabScreen(),
            RukaScreen(),
            SettingsScreen(),
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
              title: S.of(context).alruka,
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
