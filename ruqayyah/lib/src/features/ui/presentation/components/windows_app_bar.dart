import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ruqayyah/src/core/constants/const.dart';
import 'package:ruqayyah/src/core/extensions/extension_platform.dart';
import 'package:ruqayyah/src/features/ui/presentation/components/windows_button.dart';
import 'package:window_manager/window_manager.dart';

class UIAppBar extends StatefulWidget {
  final BuildContext? shellContext;

  const UIAppBar({super.key, this.shellContext});

  @override
  State<UIAppBar> createState() => _UIAppBarState();
}

class _UIAppBarState extends State<UIAppBar> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        height: kToolbarHeight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (kIsWeb)
              const Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(kAppName),
              ),
            if (PlatformExtension.isDesktop)
              Expanded(
                child: DragToMoveArea(
                  child: Row(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/logo.png",
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(kAppName),
                      ),
                    ],
                  ),
                ),
              ),
            if (!kIsWeb) const WindowButtons(),
          ],
        ),
      ),
    );
  }
}
