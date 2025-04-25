import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myproject/src/application/riverpod/app_riverpod.dart';
import 'package:myproject/src/domain/helper/const_string.dart';
import 'src/presentation/widgets/theme/theme.dart';
import 'src/application/routes/app_routes.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnglish = ref.watch(isEnglishProvider);
    final isDark = ref.watch(isDarkProvider);
    TextTheme textTheme = const TextTheme();
    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      // locale: isEnglish ? const Locale('en', 'US') : const Locale('ar', 'SA'),
      // supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],
      localizationsDelegates: const [
        // AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: isEnglish ? titleApp : titleAppAr,
      theme: isDark ? theme.dark() : theme.light(),
    );
  }
}
