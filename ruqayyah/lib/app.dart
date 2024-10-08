import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ruqayyah/generated/l10n.dart';
import 'package:ruqayyah/scroll_behavior.dart';
import 'package:ruqayyah/src/core/constants/theme_const.dart';
import 'package:ruqayyah/src/core/di/dependency_injection.dart';
import 'package:ruqayyah/src/core/extensions/extension_platform.dart';
import 'package:ruqayyah/src/features/azkar_filters/presentation/controller/cubit/azkar_filters_cubit.dart';
import 'package:ruqayyah/src/features/home/presentation/screens/dashboard_screen.dart';
import 'package:ruqayyah/src/features/settings/presentation/controller/cubit/settings_cubit.dart';
import 'package:ruqayyah/src/features/ui/presentation/components/desktop_window_wrapper.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<SettingsCubit>(),
        ),
        BlocProvider(create: (_) => sl<AzkarFiltersCubit>()),
      ],
      child: MaterialApp(
        onGenerateTitle: (context) => S.of(context).appTitle,
        scrollBehavior: AppScrollBehavior(),
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar'),
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: kAppMainColor,
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
      ),
    );
  }
}
