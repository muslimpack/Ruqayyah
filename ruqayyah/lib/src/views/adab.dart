import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruqayyah/src/shared/functions/app_print.dart';

class AdabScreen extends StatefulWidget {
  const AdabScreen({super.key});

  @override
  State<AdabScreen> createState() => _AdabScreenState();
}

class _AdabScreenState extends State<AdabScreen> {
  late final List<String> adab;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    try {
      final String data = await rootBundle.loadString('assets/json/adab.json');
      final list = json.decode(data) as List<dynamic>;
      appPrint(list);
      adab = list.map((e) => e as String).toList();
    } catch (e) {
      appPrint(e);
      adab = [];
    }

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
                            (index + 1).toString(),
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Cairo",
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            adab[index],
                            style: const TextStyle(
                              fontSize: 20,
                              fontFamily: "Cairo",
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
