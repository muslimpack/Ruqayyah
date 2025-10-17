import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia_type_enum.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/screens/rukia_viewer_screen.dart';

class RukaScreen extends StatelessWidget {
  const RukaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).alruka),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: RukiaTypeEnum.values.map(
            (x) {
              return Card(
                clipBehavior: Clip.hardEdge,
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: const Icon(
                    Icons.short_text,
                    size: 35,
                    color: kAppMainColor,
                  ),
                  title: Text(x.localeShortName(context)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RukiaViewerScreen(rukiaType: x);
                        },
                      ),
                    );
                  },
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
