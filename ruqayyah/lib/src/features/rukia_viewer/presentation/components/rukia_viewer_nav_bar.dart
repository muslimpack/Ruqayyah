// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/controller/bloc/rukia_viewer_bloc.dart';

class RukiaViewerNavBar extends StatelessWidget {
  const RukiaViewerNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Card(
        margin: const EdgeInsets.all(10).copyWith(bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: S.of(context).previous,
              onPressed: () {
                context
                    .read<RukiaViewerBloc>()
                    .add(const RukiaViewerPreviousZikrEvent());
              },
              icon: const Icon(Icons.arrow_upward),
            ),
            IconButton(
              tooltip: S.of(context).resetAll,
              onPressed: () {
                context
                    .read<RukiaViewerBloc>()
                    .add(const RukiaViewerResetAllEvent());
              },
              icon: const Icon(Icons.repeat),
            ),
            IconButton(
              tooltip: S.of(context).next,
              onPressed: () {
                context
                    .read<RukiaViewerBloc>()
                    .add(const RukiaViewerNextZikrEvent());
              },
              icon: const Icon(Icons.arrow_downward),
            ),
          ],
        ),
      ),
    );
  }
}
