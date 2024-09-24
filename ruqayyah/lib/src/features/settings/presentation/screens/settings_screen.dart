import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/features/about/presentation/screens/about_screen.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/screens/effects_manager_screen.dart';
import 'package:ruqayyah/src/features/settings/presentation/components/font_settings_widgets.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "الإعدادات",
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.speaker_group),
            title: Text(S.of(context).effectManager),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EffectsManagerScreen();
                  },
                ),
              );
            },
          ),
          const Divider(),
          Title(title: S.of(context).fontSettings),
          const FontSettingsToolbox(),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: Text(
              S.of(context).aboutUs,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const AboutScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String title;

  const Title({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
