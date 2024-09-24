// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/utils/volume_button_manager.dart';
import 'package:ruqayyah/src/features/effects_manager/presentation/controller/effect_manager.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia.dart';
import 'package:ruqayyah/src/features/home/data/models/rukia_type_enum.dart';
import 'package:ruqayyah/src/features/home/data/repository/ruki_db_helper.dart';
import 'package:ruqayyah/src/features/home/presentation/components/rukia_card.dart';
import 'package:ruqayyah/src/features/settings/data/repository/app_settings_repo.dart';
import 'package:ruqayyah/src/features/settings/presentation/components/font_settings_widgets.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class RukiaViewerScreen extends StatefulWidget {
  final RukiaTypeEnum rukiaType;
  const RukiaViewerScreen({
    super.key,
    required this.rukiaType,
  });

  @override
  State<RukiaViewerScreen> createState() => _RukiaViewerScreenState();
}

class _RukiaViewerScreenState extends State<RukiaViewerScreen> {
  late List<Rukia> rukiasToView;
  late final PageController _pageController;

  int currentPage = 0;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    _start();
  }

  @override
  void dispose() {
    _pageController.dispose();
    WakelockPlus.disable();
    sl<VolumeButtonManager>().dispose();
    super.dispose();
  }

  Future _start() async {
    _pageController = PageController();
    _pageController.addListener(_pageChange);

    if (sl<AppSettingsRepo>().enableWakeLock) {
      await WakelockPlus.enable();
    }

    sl<VolumeButtonManager>().toggleActivation(
      activate: sl<AppSettingsRepo>().praiseWithVolumeKeys,
    );

    sl<VolumeButtonManager>().listen(
      onVolumeUpPressed: () => _onTap(currentPage),
      onVolumeDownPressed: () => _onTap(currentPage),
    );

    await _loadData();

    setState(() {
      isLoading = false;
    });
  }

  Future _loadData() async {
    rukiasToView =
        await sl<RukiaDBHelper>().getRukiaListByType(widget.rukiaType);
  }

  Future _reset() async {
    await _loadData();
    _pageController.jumpTo(0);
    setState(() {});
  }

  void _pageChange() {
    setState(() {
      currentPage = _pageController.page?.toInt() ?? 0;
    });
  }

  double get done => rukiasToView.where((x) => x.count == 0).length.toDouble();
  double get majorProgress {
    if (rukiasToView.isEmpty) return 1;
    return done / rukiasToView.length;
  }

  Future<void> _onTap(int index) async {
    final rukia = rukiasToView[index];

    if (rukia.count > 0) {
      rukiasToView[index] = rukia.copyWith(count: rukia.count - 1);
      sl<EffectsManager>().onCount();

      if (rukia.count == 1) {
        sl<EffectsManager>().onSingleDone();
      }

      if (done / rukiasToView.length == 1) {
        sl<EffectsManager>().onAllDone();
      }
    }

    if (rukia.count <= 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) return const Center(child: CircularProgressIndicator());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.rukiaType.localeName(context)),
        centerTitle: true,
        leading: const FontSettingsIconButton(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("${currentPage + 1} : ${rukiasToView.length}"),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: LinearProgressIndicator(
            value: majorProgress,
          ),
        ),
      ),
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.vertical,
            itemCount: rukiasToView.length,
            itemBuilder: (context, index) {
              return RukiaCard(
                rukia: rukiasToView[index],
                onTap: () => _onTap(index),
              );
            },
          ),
          Opacity(
            opacity: .5,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Card(
                margin: const EdgeInsets.all(10).copyWith(bottom: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_upward),
                    ),
                    IconButton(
                      onPressed: () {
                        _reset();
                      },
                      icon: const Icon(Icons.repeat),
                    ),
                    IconButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      icon: const Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
