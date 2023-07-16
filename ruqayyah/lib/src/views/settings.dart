import 'package:flutter/material.dart';
import 'package:ruqayyah/src/helpers/settings_helper.dart';
import 'package:ruqayyah/src/views/about.dart';
import 'package:ruqayyah/src/views/effects_manager.dart';

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
          SwitchListTile(
            title: const Text("الوضع المظلم"),
            value: settingsHelper.isDark,
            onChanged: (value) {
              settingsHelper.changeIsDarkStatus(value: value);
              setState(() {});
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.speaker_group),
            title: const Text("مدير المؤثرات"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const EffectManagerScreen();
                  },
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_rounded),
            title: const Text(
              "عنا",
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const About();
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
