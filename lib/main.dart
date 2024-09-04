import 'package:avir_app/core/DI/di_container.dart';
import 'package:avir_app/core/theme/app_theme.dart';
import 'package:avir_app/core/utils/route/go_router.dart';
import 'package:avir_app/features/auth/presentation/login_screen.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await initDi();
  await getIt.allReady();
  runApp(EasyLocalization(
      supportedLocales: const [Locale('uz'), Locale('ru')],
      path: 'assets/translations',
      fallbackLocale: const Locale('uz'),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      routerConfig: AppRouter.router,
    );
  }
}
