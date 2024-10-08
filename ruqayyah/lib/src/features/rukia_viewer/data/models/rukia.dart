import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Rukia extends Equatable {
  final int id;
  final int order;
  final String zikr;
  final int count;
  final String source;
  final int? almujaza;
  final int? almutawasita;
  final int? almutawala;
  final String hokm;
  const Rukia({
    required this.id,
    required this.order,
    required this.zikr,
    required this.count,
    required this.source,
    required this.almujaza,
    required this.almutawasita,
    required this.almutawala,
    required this.hokm,
  });

  Rukia copyWith({
    int? id,
    int? order,
    String? zikr,
    int? count,
    String? source,
    int? almujaza,
    int? almutawasita,
    int? almutawala,
    String? hokm,
  }) {
    return Rukia(
      id: id ?? this.id,
      order: order ?? this.order,
      zikr: zikr ?? this.zikr,
      count: count ?? this.count,
      source: source ?? this.source,
      almujaza: almujaza ?? this.almujaza,
      almutawasita: almutawasita ?? this.almutawasita,
      almutawala: almutawala ?? this.almutawala,
      hokm: hokm ?? this.hokm,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'zikr': zikr,
      'count': count,
      'source': source,
      'almujaza': almujaza,
      'almutawasita': almutawasita,
      'almutawala': almutawala,
      'hokm': hokm,
    };
  }

  factory Rukia.fromMap(Map<String, dynamic> map) {
    return Rukia(
      id: map['id'] as int,
      order: map['order'] as int,
      zikr: map['zikr'] as String,
      count: map['count'] as int,
      source: map['source'] as String,
      almujaza: map['almujaza'] != null ? map['almujaza'] as int : null,
      almutawasita:
          map['almutawasita'] != null ? map['almutawasita'] as int : null,
      almutawala: map['almutawala'] != null ? map['almutawala'] as int : null,
      hokm: map['hokm'] as String,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      order,
      zikr,
      count,
      source,
      almujaza,
      almutawasita,
      almutawala,
      hokm,
    ];
  }
}
