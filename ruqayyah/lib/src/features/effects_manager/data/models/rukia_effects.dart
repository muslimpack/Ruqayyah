// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class RukiaEffects extends Equatable {
  final double soundEffectVolume;

  final bool soundOnCount;
  final bool soundEveryZikr;
  final bool soundOnAllDone;

  final bool vibrateOnCount;
  final bool vibrateEveryZikr;
  final bool vibrateOnAllDone;

  const RukiaEffects({
    required this.soundEffectVolume,
    required this.soundOnCount,
    required this.soundEveryZikr,
    required this.soundOnAllDone,
    required this.vibrateOnCount,
    required this.vibrateEveryZikr,
    required this.vibrateOnAllDone,
  });

  RukiaEffects copyWith({
    double? soundEffectVolume,
    bool? soundOnCount,
    bool? soundEveryZikr,
    bool? soundOnAllDone,
    bool? vibrateOnCount,
    bool? vibrateEveryZikr,
    bool? vibrateOnAllDone,
  }) {
    return RukiaEffects(
      soundEffectVolume: soundEffectVolume ?? this.soundEffectVolume,
      soundOnCount: soundOnCount ?? this.soundOnCount,
      soundEveryZikr: soundEveryZikr ?? this.soundEveryZikr,
      soundOnAllDone: soundOnAllDone ?? this.soundOnAllDone,
      vibrateOnCount: vibrateOnCount ?? this.vibrateOnCount,
      vibrateEveryZikr: vibrateEveryZikr ?? this.vibrateEveryZikr,
      vibrateOnAllDone: vibrateOnAllDone ?? this.vibrateOnAllDone,
    );
  }

  @override
  List<Object> get props {
    return [
      soundEffectVolume,
      soundOnCount,
      soundEveryZikr,
      soundOnAllDone,
      vibrateOnCount,
      vibrateEveryZikr,
      vibrateOnAllDone,
    ];
  }
}
