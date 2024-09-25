import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/adab_screen.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia_type_enum.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/screens/rukia_viewer_screen.dart';
import 'package:ruqayyah/src/features/settings/presentation/screens/settings_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2 + RukiaTypeEnum.values.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
          controller: _tabController,
          children: [
            const AdabScreen(),
            ...RukiaTypeEnum.values.map((x) => RukiaViewerScreen(rukiaType: x)),
            const SettingsScreen(),
          ],
        ),
        bottomNavigationBar: ConvexAppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          activeColor: kAppMainColor,
          shadowColor: kAppMainColor,
          controller: _tabController,
          items: [
            TabItem(
              icon: Icons.question_mark,
              title: S.of(context).ruqyahEtiquette,
            ),
            ...RukiaTypeEnum.values.map(
              (x) => TabItem(
                icon: Icons.short_text,
                title: x.localeShortName(context),
              ),
            ),
            TabItem(icon: Icons.settings, title: S.of(context).settings),
          ],
        ),
      ),
    );
  }
}
