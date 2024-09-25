// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/shared/dialogs/yes_no_dialog.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia_type_enum.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/components/rukia_card.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/components/rukia_viewer_nav_bar.dart';
import 'package:ruqayyah/src/features/rukia_viewer/presentation/controller/bloc/rukia_viewer_bloc.dart';

class RukiaViewerScreen extends StatelessWidget {
  final RukiaTypeEnum rukiaType;
  const RukiaViewerScreen({
    super.key,
    required this.rukiaType,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<RukiaViewerBloc>()..add(RukiaViewerStartEvent(rukiaType)),
      child: BlocConsumer<RukiaViewerBloc, RukiaViewerState>(
        listener: (context, state) async {
          if (state is! RukiaViewerLoadedState) return;

          if (!state.askToRestoreSession) return;

          final bool? confirm = await showDialog(
            context: context,
            builder: (context) {
              return YesOrNoDialog(
                msg: S.of(context).resumeLastSession,
                description: state.rukiaType.localeName(context),
              );
            },
          );

          if (!context.mounted) return;

          context
              .read<RukiaViewerBloc>()
              .add(RukiaViewerRestoreSessionEvent(confirm ?? false));
        },
        builder: (context, state) {
          if (state is! RukiaViewerLoadedState) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(
              title: Text(state.rukiaType.localeName(context)),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "${state.currentIndex + 1} : ${state.rukiasToView.length}",
                  ),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10),
                child: LinearProgressIndicator(
                  value: state.majorProgress,
                ),
              ),
            ),
            body: Stack(
              children: [
                PageView.builder(
                  controller: context.read<RukiaViewerBloc>().pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: state.rukiasToView.length,
                  itemBuilder: (context, index) {
                    final rukia = state.rukiasToView[index];
                    return RukiaCard(
                      rukia: rukia,
                      onTap: () => context
                          .read<RukiaViewerBloc>()
                          .add(RukiaViewerDecreaseEvent(rukia)),
                    );
                  },
                ),
                const Opacity(
                  opacity: .5,
                  child: RukiaViewerNavBar(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
