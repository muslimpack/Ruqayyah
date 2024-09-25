// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'rukia_viewer_bloc.dart';

sealed class RukiaViewerState extends Equatable {
  const RukiaViewerState();

  @override
  List<Object> get props => [];
}

final class RukiaViewerLoadingState extends RukiaViewerState {}

class RukiaViewerLoadedState extends RukiaViewerState {
  final int currentIndex;
  final List<Rukia> rukias;
  final RukiaTypeEnum rukiaType;
  final List<Rukia> rukiasToView;

  const RukiaViewerLoadedState({
    required this.currentIndex,
    required this.rukias,
    required this.rukiaType,
    required this.rukiasToView,
  });

  Rukia? get activeZikr {
    if (rukiasToView.isEmpty) return null;
    if (currentIndex == -1) return null;
    return rukiasToView[currentIndex];
  }

  double get done => rukiasToView.where((x) => x.count == 0).length.toDouble();
  double get majorProgress {
    if (rukiasToView.isEmpty) return 1;
    return done / rukiasToView.length;
  }

  @override
  List<Object> get props => [rukiaType, currentIndex, rukias, rukiasToView];

  RukiaViewerLoadedState copyWith({
    int? currentIndex,
    List<Rukia>? rukias,
    RukiaTypeEnum? rukiaType,
    List<Rukia>? rukiasToView,
  }) {
    return RukiaViewerLoadedState(
      currentIndex: currentIndex ?? this.currentIndex,
      rukias: rukias ?? this.rukias,
      rukiaType: rukiaType ?? this.rukiaType,
      rukiasToView: rukiasToView ?? this.rukiasToView,
    );
  }
}