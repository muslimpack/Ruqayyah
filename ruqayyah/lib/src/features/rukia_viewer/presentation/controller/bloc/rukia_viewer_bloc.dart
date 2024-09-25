// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
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
  final AppSettingsRepo appSettingsRepo;
  final RukiaDBHelper rukiaDBHelper;
  final AzkarFiltersRepo azkarFiltersRepo;
  final VolumeButtonManager volumeButtonManager;
  final EffectsManager effectsManager;
  RukiaViewerBloc(
    this.appSettingsRepo,
    this.rukiaDBHelper,
    this.azkarFiltersRepo,
    this.volumeButtonManager,
    this.effectsManager,
  ) : super(RukiaViewerLoadingState()) {
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
    if (appSettingsRepo.enableWakeLock) {
      await WakelockPlus.enable();
    }

    volumeButtonManager.toggleActivation(
      activate: appSettingsRepo.praiseWithVolumeKeys,
    );

    volumeButtonManager.listen(
      onVolumeUpPressed: () => add(const RukiaViewerDecreaseActiveEvent()),
      onVolumeDownPressed: () => add(const RukiaViewerDecreaseActiveEvent()),
    );

    final rukiasFromDB =
        await rukiaDBHelper.getRukiaListByType(event.rukiaType);
    final List<Filter> filters = azkarFiltersRepo.getAllFilters;
    final filteredAzkar = filters.getFilteredZikr(rukiasFromDB);
    final rukias = filteredAzkar;
    final rukiasToView = List<Rukia>.from(rukias);

    emit(
      RukiaViewerLoadedState(
        currentIndex: 0,
        rukiasToView: rukiasToView,
        rukias: rukias,
        rukiaType: event.rukiaType,
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

    final activeZikrIndex =
        state.rukiasToView.indexWhere((x) => x.id == activeZikr.id);

    final int count = activeZikr.count;

    final rukiasToView = List<Rukia>.from(state.rukiasToView);

    if (count > 0) {
      rukiasToView[activeZikrIndex] = activeZikr.copyWith(count: count - 1);

      effectsManager.onCount();
    }

    if (count == 1) {
      effectsManager.onSingleDone();
      final totalProgress =
          rukiasToView.where((x) => x.count == 0).length / rukiasToView.length;

      if (totalProgress == 1) {
        effectsManager.onAllDone();
      }
    }

    if (count <= 1) {
      if (pageController.hasClients) {
        pageController.nextPage(
          curve: Curves.easeIn,
          duration: const Duration(milliseconds: 300),
        );
      }
    }

    emit(state.copyWith(rukiasToView: rukiasToView));
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

  @override
  Future<void> close() async {
    pageController.dispose();
    WakelockPlus.disable();
    volumeButtonManager.dispose();
    return super.close();
  }
}
