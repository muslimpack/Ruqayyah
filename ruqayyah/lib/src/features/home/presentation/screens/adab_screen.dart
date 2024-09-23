import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/home/data/models/instruction.dart';
import 'package:ruqayyah/src/features/home/data/repository/ruki_db_helper.dart';

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
        title: const Text("إرشادات عامة تُراعى عند الرقية :"),
        centerTitle: true,
      ),
      body: isLoading
          ? const SizedBox()
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: adab.length,
              itemBuilder: (context, index) {
                final instruction = adab[index];
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            instruction.order.toString(),
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            instruction.instruction,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
