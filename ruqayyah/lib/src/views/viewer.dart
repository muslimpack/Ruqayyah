// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ruqayyah/src/models/rukia.dart';

class Viewer extends StatefulWidget {
  final List<Rukia> rukias;
  const Viewer({
    super.key,
    required this.rukias,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        itemCount: rukiasToView.length,
        itemBuilder: (context, index) {
          final item = rukiasToView[index];
          return InkWell(
            onTap: () {
              final count = item.count - 1;
              rukiasToView[index] = item.copyWith(count: count < 0 ? 0 : count);
              if (count <= 0) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
              setState(() {});
            },
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
                          fontSize: 150,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          item.zikr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
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
