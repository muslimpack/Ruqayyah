import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/effects_manager/data/repository/effects_repo.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';

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
              value: sl<EffectsRepo>().soundEffectVolume,
              onChanged: (value) {
                sl<EffectsRepo>().changeSoundEffectVolume(value);
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
            value: sl<EffectsRepo>().isOnCountVibrateAllowed,
            onChanged: (value) {
              sl<EffectsRepo>().changeOnCountVibrateStatus(value: value);

              if (value) {
                sl<EffectsManager>().onCountVibration();
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
            value: sl<EffectsRepo>().isOnCountSoundAllowed,
            onChanged: (value) async {
              sl<EffectsRepo>().changeOnCountStatus(value: value);

              if (value) {
                await sl<EffectsManager>().onCountSound();
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
            value: sl<EffectsRepo>().isSingleDoneVibrateAllowed,
            onChanged: (value) async {
              sl<EffectsRepo>().changeSingleDoneVibrateStatus(value: value);

              if (value) {
                await sl<EffectsManager>().onSingleDoneVibration();
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
            value: sl<EffectsRepo>().isSingleDoneSoundAllowed,
            onChanged: (value) async {
              sl<EffectsRepo>().changeSingleDoneSoundStatus(value: value);

              if (value) {
                await sl<EffectsManager>().onAllDoneSound();
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
            value: sl<EffectsRepo>().isAllDoneVibrateAllowed,
            onChanged: (value) {
              sl<EffectsRepo>().changeAllDoneVibrateStatus(
                value: value,
              );

              if (value) {
                sl<EffectsManager>().onAllDoneVibration();
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
            value: sl<EffectsRepo>().isAllDoneSoundAllowed,
            onChanged: (value) {
              sl<EffectsRepo>().changeAllDoneSoundStatus(value: value);

              if (value) {
                sl<EffectsManager>().onAllDoneSound();
              }
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
