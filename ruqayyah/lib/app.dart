import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/src/core/extensions/extension_platform.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/dashboard_screen.dart';
import 'package:ruqayyah/src/features/ui/presentation/components/desktop_window_wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => S.of(context).appTitle,
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar', 'EG'),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepOrange,
          brightness: Brightness.dark,
        ),
        fontFamily: "Cairo",
        useMaterial3: true,
      ),
      builder: (context, child) {
        if (PlatformExtension.isDesktop) {
          return DesktopWindowWrapper(
            child: child,
          );
        }
        return child ?? const SizedBox();
      },
      home: const DashboardScreen(),
    );
  }
}
