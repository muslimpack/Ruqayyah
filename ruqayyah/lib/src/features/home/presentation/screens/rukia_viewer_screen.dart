// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia.dart';
import 'package:ruqayyah/src/features/home/presentation/components/rukia_content_builder.dart';
import 'package:ruqayyah/src/features/settings/presentation/controller/cubit/settings_cubit.dart';

class RukiaViewerScreen extends StatefulWidget {
  final String title;
  final List<Rukia> rukias;
  const RukiaViewerScreen({
    super.key,
    required this.rukias,
    required this.title,
  });

  @override
  State<RukiaViewerScreen> createState() => _RukiaViewerScreenState();
}

class _RukiaViewerScreenState extends State<RukiaViewerScreen> {
  late final List<Rukia> rukiasToView;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    rukiasToView = List.from(widget.rukias.map((e) => e.copyWith()).toList());
    _pageController = PageController();

    _pageController.addListener(_pageChange);
  }

  void _pageChange() {
    setState(() {
      currentPage = _pageController.page?.toInt() ?? 0;
    });
  }

  int done = 0;
  double totalProgress = 0.0;

  Future<void> _onTap(int index) async {
    final item = rukiasToView[index];

    final count = item.count - 1;

    if (item.count > 0 && count >= 0) {
      rukiasToView[index] = item.copyWith(count: count < 0 ? 0 : count);
      if (count == 0) done += 1;
      await sl<EffectsManager>().onCount();
    }

    if (count <= 0) {
      await sl<EffectsManager>().onSingleDone();
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    if (done / rukiasToView.length == 1) {
      sl<EffectsManager>().onAllDone();
    }

    setState(() {});
  }

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("${rukiasToView.length} : $currentPage"),
          ),
        ],
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
            child: Stack(
              children: [
                Center(
                  child: Opacity(
                    opacity: .2,
                    child: Text(
                      item.count.toString(),
                      style: const TextStyle(
                        fontSize: 450,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ),
                ListView(
                  padding: const EdgeInsets.all(20),
                  physics: const ClampingScrollPhysics(),
                  children: [
                    RukiaContentBuilder(
                      rukia: item,
                      fontSize:
                          context.watch<SettingsCubit>().state.fontSize * 10,
                      enableDiacritics:
                          context.watch<SettingsCubit>().state.showDiacritics,
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
              ],
            ),
          );
        },
      ),
    );
  }
}
