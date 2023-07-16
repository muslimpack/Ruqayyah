// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ruqayyah/src/models/rukia.dart';
import 'package:ruqayyah/src/utils/effect_manager.dart';

class Viewer extends StatefulWidget {
  final String title;
  final List<Rukia> rukias;
  const Viewer({
    super.key,
    required this.rukias,
    required this.title,
  });

  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  late final List<Rukia> rukiasToView;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    rukiasToView = List.from(widget.rukias.map((e) => e.copyWith()).toList());
    _pageController = PageController();
  }

  int done = 0;
  double totalProgress = 0.0;

  Future<void> _onTap(int index) async {
    final item = rukiasToView[index];

    final count = item.count - 1;

    if (item.count > 0 && count >= 0) {
      rukiasToView[index] = item.copyWith(count: count < 0 ? 0 : count);
      if (count == 0) done += 1;
      await EffectManager.onCount();
    }

    if (count <= 0) {
      await EffectManager.onSingleDone();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: LinearProgressIndicator(
            value: done / rukiasToView.length,
          ),
        ),
      ),
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: rukiasToView.length,
        itemBuilder: (context, index) {
          final item = rukiasToView[index];
          return InkWell(
            onTap: () async => _onTap(index),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Center(
                    child: Opacity(
                      opacity: .2,
                      child: Text(
                        item.count.toString(),
                        style: const TextStyle(
                          fontSize: 300,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: ListView(
                      children: [
                        Text(
                          item.zikr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text(
                            item.source,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
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
