import 'package:flutter/material.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/home/data/models/instruction.dart';
import 'package:ruqayyah/src/features/home/data/repository/ruki_db_helper.dart';
import 'package:ruqayyah/src/features/home/presentation/components/instruction_card.dart';

class AdabScreen extends StatefulWidget {
  const AdabScreen({super.key});

  @override
  State<AdabScreen> createState() => _AdabScreenState();
}

class _AdabScreenState extends State<AdabScreen> {
  late final List<Instruction> adab;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    adab = await sl<RukiaDBHelper>().getAllInstructions();

    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).generalGuidelinesForRuqyah),
        centerTitle: true,
      ),
      body: isLoading
          ? const SizedBox()
          : ListView.builder(
              padding: const EdgeInsets.all(10).copyWith(bottom: 50),
              itemCount: adab.length,
              itemBuilder: (context, index) {
                return InstructionCard(instruction: adab[index]);
              },
            ),
    );
  }
}
