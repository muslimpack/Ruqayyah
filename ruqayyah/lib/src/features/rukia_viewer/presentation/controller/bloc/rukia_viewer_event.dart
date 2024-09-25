// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'rukia_viewer_bloc.dart';

sealed class RukiaViewerEvent extends Equatable {
  const RukiaViewerEvent();

  @override
  List<Object> get props => [];
}

class RukiaViewerStartEvent extends RukiaViewerEvent {
  final RukiaTypeEnum rukiaType;
  const RukiaViewerStartEvent(
    this.rukiaType,
  );

  @override
  List<Object> get props => [rukiaType];
}

class RukiaViewerDecreaseEvent extends RukiaViewerEvent {
  final Rukia rukia;
  const RukiaViewerDecreaseEvent(
    this.rukia,
  );

  @override
  List<Object> get props => [rukia];
}

class RukiaViewerDecreaseActiveEvent extends RukiaViewerEvent {
  const RukiaViewerDecreaseActiveEvent();
}

class RukiaViewerResetAllEvent extends RukiaViewerEvent {
  const RukiaViewerResetAllEvent();
}

class RukiaViewerNextZikrEvent extends RukiaViewerEvent {
  const RukiaViewerNextZikrEvent();
}

class RukiaViewerPreviousZikrEvent extends RukiaViewerEvent {
  const RukiaViewerPreviousZikrEvent();
}

class RukiaViewerUpdatePageEvent extends RukiaViewerEvent {
  final int index;
  const RukiaViewerUpdatePageEvent({required this.index});

  @override
  List<Object> get props => [index];
}
