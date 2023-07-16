import 'package:flutter/material.dart';
import 'package:ruqayyah/src/helpers/settings_helper.dart';
import 'package:ruqayyah/src/utils/effect_manager.dart';

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
            value: settingsHelper.isTallyVibrateAllowed,
            onChanged: (value) {
              settingsHelper.changeTallyVibrateStatus(value: value);

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
            value: settingsHelper.isTallySoundAllowed,
            onChanged: (value) {
              settingsHelper.changeTallySoundStatus(value: value);

              if (value) {
                EffectManager.onCountSound();
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
            value: settingsHelper.isZikrDoneVibrateAllowed,
            onChanged: (value) {
              settingsHelper.changeZikrDoneVibrateStatus(value: value);

              if (value) {
                EffectManager.onSingleDoneVibration();
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
            value: settingsHelper.isZikrDoneSoundAllowed,
            onChanged: (value) {
              settingsHelper.changeZikrDoneSoundStatus(value: value);

              if (value) {
                EffectManager.onAllDoneSound();
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
            value: settingsHelper.isAllAzkarFinishedVibrateAllowed,
            onChanged: (value) {
              settingsHelper.changeAllAzkarFinishedVibrateStatus(
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
            value: settingsHelper.isAllAzkarFinishedSoundAllowed,
            onChanged: (value) {
              settingsHelper.changeAllAzkarFinishedSoundStatus(value: value);

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
