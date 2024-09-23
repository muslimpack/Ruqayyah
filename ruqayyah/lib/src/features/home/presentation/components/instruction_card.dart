import 'package:flutter/material.dart';
import 'package:ruqayyah/src/features/home/data/models/instruction.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({
    super.key,
    required this.instruction,
  });

  final Instruction instruction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        isThreeLine: true,
        leading: Card(
          color: Colors.deepOrange,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 15),
              child: Text(instruction.order.toString()),
            ),
          ),
        ),
        subtitle: Text(
          instruction.instruction,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
