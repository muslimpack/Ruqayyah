import 'package:flutter/material.dart';
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
              value: effectsRepo.soundEffectVolume,
              onChanged: (value) {
                effectsRepo.changeSoundEffectVolume(value);
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
            value: effectsRepo.isOnCountVibrateAllowed,
            onChanged: (value) {
              effectsRepo.changeOnCountVibrateStatus(value: value);

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
            value: effectsRepo.isOnCountSoundAllowed,
            onChanged: (value) async {
              effectsRepo.changeOnCountStatus(value: value);

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
            value: effectsRepo.isSingleDoneVibrateAllowed,
            onChanged: (value) async {
              effectsRepo.changeSingleDoneVibrateStatus(value: value);

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
            value: effectsRepo.isSingleDoneSoundAllowed,
            onChanged: (value) async {
              effectsRepo.changeSingleDoneSoundStatus(value: value);

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
            value: effectsRepo.isAllDoneVibrateAllowed,
            onChanged: (value) {
              effectsRepo.changeAllDoneVibrateStatus(
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
            value: effectsRepo.isAllDoneSoundAllowed,
            onChanged: (value) {
              effectsRepo.changeAllDoneSoundStatus(value: value);

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
