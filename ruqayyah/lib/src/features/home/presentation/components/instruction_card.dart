import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruqayyah/src/features/home/data/models/instruction.dart';
import 'package:ruqayyah/src/features/settings/presentation/controller/cubit/settings_cubit.dart';

class InstructionCard extends StatelessWidget {
  const InstructionCard({
    super.key,
    required this.instruction,
  });

  final Instruction instruction;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.deepOrange,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: 15),
                  child: Text(instruction.order.toString()),
                ),
              ),
            ),
            Text(
              instruction.instruction,
              style: TextStyle(
                fontSize: context.watch<SettingsCubit>().state.fontSize * 10,
                fontFamily: "kitab",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
