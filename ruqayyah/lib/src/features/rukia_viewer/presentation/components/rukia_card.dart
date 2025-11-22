// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/components/rukia_content_builder.dart';
import 'package:ruqayyah/src/features/settings/presentation/controller/cubit/settings_cubit.dart';

class RukiaCard extends StatelessWidget {
  final Function() onTap;
  final Rukia rukia;
  const RukiaCard({
    super.key,
    required this.onTap,
    required this.rukia,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FittedBox(
                child: Text(
                  rukia.count.toString(),
                  style: TextStyle(
                    fontSize: 450,
                    fontWeight: FontWeight.bold,
                    color: kAppMainColor.withAlpha(30),
                  ),
                ),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.all(20),
            physics: const ClampingScrollPhysics(),
            children: [
              RukiaContentBuilder(
                rukia: rukia,
                fontSize: context.watch<SettingsCubit>().state.fontSize * 10,
                enableDiacritics: context.watch<SettingsCubit>().state.showDiacritics,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  rukia.source,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
