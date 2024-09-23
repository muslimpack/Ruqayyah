// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Instruction extends Equatable {
  final int id;
  final int order;
  final String instruction;

  const Instruction({
    required this.id,
    required this.order,
    required this.instruction,
  });

  @override
  List<Object?> get props => [id, order, instruction];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order': order,
      'instruction': instruction,
    };
  }

  factory Instruction.fromMap(Map<String, dynamic> map) {
    return Instruction(
      id: map['id'] as int,
      order: map['order'] as int,
      instruction: map['instruction'] as String,
    );
  }
}
