import 'package:flutter/material.dart';
import 'package:ruqayyah/src/features/settings/data/repository/settings_helper.dart';
import 'package:ruqayyah/src/core/utils/effect_manager.dart';

class EffectManagerScreen extends StatefulWidget {
  const EffectManagerScreen({super.key});

  @override
  State<EffectManagerScreen> createState() => _EffectManagerScreenState();
}

class _EffectManagerScreenState extends State<EffectManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "مدير المؤثرات",
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          ListTile(
            leading: const Icon(
              Icons.volume_up,
            ),
            title: const Text("مستوى صوت المؤثرات"),
            subtitle: Slider(
              value: settingsHelper.soundEffectVolume,
              onChanged: (value) {
                settingsHelper.changeSoundEffectVolume(value);
                setState(() {});
              },
            ),
          ),

          const Divider(),

          /// Tally Sound Allowed Vibrate
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.vibration,
              ),
              title: Text("الإهتزاز عند كل مرة"),
            ),
            value: settingsHelper.isOnCountVibrateAllowed,
            onChanged: (value) {
              settingsHelper.changeOnCountVibrateStatus(value: value);

              if (value) {
                EffectManager.onCountVibration();
              }

              setState(() {});
            },
          ),

          /// Tally Sound Allowed
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.speaker,
              ),
              title: Text("صوت عند كل مرة"),
            ),
            value: settingsHelper.isOnCountSoundAllowed,
            onChanged: (value) async {
              settingsHelper.changeOnCountStatus(value: value);

              if (value) {
                await EffectManager.onCountSound();
              }

              setState(() {});
            },
          ),

          /// Zikr Done Sound Allowed Vibrate
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.vibration,
              ),
              title: Text("الإهتزاز عند انتهاء كل ذكر"),
            ),
            value: settingsHelper.isSingleDoneVibrateAllowed,
            onChanged: (value) async {
              settingsHelper.changeSingleDoneVibrateStatus(value: value);

              if (value) {
                await EffectManager.onSingleDoneVibration();
              }
              setState(() {});
            },
          ),

          /// Zikr Done Sound Allowed
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.speaker,
              ),
              title: Text("صوت عند انتهاء كل ذكر"),
            ),
            value: settingsHelper.isSingleDoneSoundAllowed,
            onChanged: (value) async {
              settingsHelper.changeSingleDoneSoundStatus(value: value);

              if (value) {
                await EffectManager.onAllDoneSound();
              }
              setState(() {});
            },
          ),

          /// Azkar Done Sound Allowed vibrate
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.vibration,
              ),
              title: Text("الإهتزاز عند الانتهاء من جميع الأذكار"),
            ),
            value: settingsHelper.isAllDoneVibrateAllowed,
            onChanged: (value) {
              settingsHelper.changeAllDoneVibrateStatus(
                value: value,
              );

              if (value) {
                EffectManager.onAllDoneVibration();
              }
              setState(() {});
            },
          ),

          /// Azkar Done Sound Allowed
          SwitchListTile(
            title: const ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                Icons.speaker,
              ),
              title: Text("صوت عند الانتهاء من جميع الأذكار"),
            ),
            value: settingsHelper.isAllDoneSoundAllowed,
            onChanged: (value) {
              settingsHelper.changeAllDoneSoundStatus(value: value);

              if (value) {
                EffectManager.onAllDoneSound();
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
