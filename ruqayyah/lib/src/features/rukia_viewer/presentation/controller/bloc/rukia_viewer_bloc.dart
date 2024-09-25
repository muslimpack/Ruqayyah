import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/utils/volume_button_manager.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/models/zikr_filter.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/models/zikr_filter_list_extension.dart';
import 'package:ruqayyah/src/features/azkar_filters/data/repository/azakr_filters_repo.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/models/rukia_type_enum.dart';
import 'package:ruqayyah/src/features/rukia_viewer/data/repository/ruki_db_helper.dart';
import 'package:ruqayyah/src/features/settings/data/repository/app_settings_repo.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

part 'rukia_viewer_event.dart';
part 'rukia_viewer_state.dart';

class RukiaViewerBloc extends Bloc<RukiaViewerEvent, RukiaViewerState> {
  final PageController pageController = PageController();
  RukiaViewerBloc() : super(RukiaViewerLoadingState()) {
    _initHandlers();

    pageController.addListener(_pageChange);
  }

  void _initHandlers() {
    on<RukiaViewerStartEvent>(_start);
    on<RukiaViewerDecreaseEvent>(_decrease);
    on<RukiaViewerDecreaseActiveEvent>(_decreaseActive);
    on<RukiaViewerResetAllEvent>(_resetAll);
    on<RukiaViewerNextZikrEvent>(_next);
    on<RukiaViewerPreviousZikrEvent>(_previous);
    on<RukiaViewerUpdatePageEvent>(_updatePageIndex);
  }

  void _pageChange() {
    final int currentPage = pageController.page?.toInt() ?? 0;
    add(RukiaViewerUpdatePageEvent(index: currentPage));
  }

  FutureOr<void> _start(
    RukiaViewerStartEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    if (sl<AppSettingsRepo>().enableWakeLock) {
      await WakelockPlus.enable();
    }

    sl<VolumeButtonManager>().toggleActivation(
      activate: sl<AppSettingsRepo>().praiseWithVolumeKeys,
    );

    sl<VolumeButtonManager>().listen(
      onVolumeUpPressed: () => add(const RukiaViewerDecreaseActiveEvent()),
      onVolumeDownPressed: () => add(const RukiaViewerDecreaseActiveEvent()),
    );

    final rukiasFromDB =
        await sl<RukiaDBHelper>().getRukiaListByType(event.rukiaType);
    final List<Filter> filters = sl<AzkarFiltersRepo>().getAllFilters;
    final filteredAzkar = filters.getFilteredZikr(rukiasFromDB);
    final rukias = filteredAzkar;
    final rukiasToView = List<Rukia>.from(rukias);

    emit(
      RukiaViewerLoadedState(
        currentIndex: 0,
        rukiasToView: rukiasToView,
        rukias: rukias,
      ),
    );
  }

  FutureOr<void> _decrease(
    RukiaViewerDecreaseEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    final state = this.state;
    if (state is! RukiaViewerLoadedState) return;

    final activeZikr = event.rukia;

    final activeZikrIndex = state.rukiasToView.indexWhere(
      (x) => x.id == activeZikr.id,
    );
    final rukiasToView = List<Rukia>.from(state.rukiasToView);

    if (activeZikr.count > 0) {
      rukiasToView[activeZikrIndex] =
          activeZikr.copyWith(count: activeZikr.count - 1);
      sl<EffectsManager>().onCount();

      if (activeZikr.count == 1) {
        sl<EffectsManager>().onSingleDone();
      }

      final totalProgress =
          rukiasToView.where((x) => x.count == 0).length / rukiasToView.length;
      if (totalProgress == 1) {
        sl<EffectsManager>().onAllDone();
      }
    }

    if (activeZikr.count <= 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  FutureOr<void> _decreaseActive(
    RukiaViewerDecreaseActiveEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    final state = this.state;
    if (state is! RukiaViewerLoadedState) return;
    final activeZikr = state.activeZikr;
    if (activeZikr == null) return;

    add(RukiaViewerDecreaseEvent(activeZikr));
  }

  FutureOr<void> _resetAll(
    RukiaViewerResetAllEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    final state = this.state;
    if (state is! RukiaViewerLoadedState) return;

    final rukiasToView = List<Rukia>.from(state.rukias);
    emit(state.copyWith(rukiasToView: rukiasToView));
    pageController.jumpTo(0);
  }

  FutureOr<void> _next(
    RukiaViewerNextZikrEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  FutureOr<void> _previous(
    RukiaViewerPreviousZikrEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  FutureOr<void> _updatePageIndex(
    RukiaViewerUpdatePageEvent event,
    Emitter<RukiaViewerState> emit,
  ) async {
    final state = this.state;
    if (state is! RukiaViewerLoadedState) return;

    emit(state.copyWith(currentIndex: event.index));
  }
}
