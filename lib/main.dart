import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:raparva_app/app/localization/localization.dart';
import 'package:raparva_app/core/HiveStorage/hive_key.dart';
import 'package:raparva_app/core/languages/language_provider.dart';
import 'package:raparva_app/core/utils/network_status_widget.dart';
import 'package:raparva_app/routing/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  try {
    await Hive.openBox(HiveKeys.languageBox);
  } catch (e) {
    debugPrint("Error opening Hive box: $e");
  }

  runApp(const ProviderScope(child: MyApp()));

  // 🔄 For Device Preview (optional, only enable for debug/testing)
  // runApp(
  //   DevicePreview(
  //     enabled: !kReleaseMode,
  //     builder: (context) => const ProviderScope(child: MyApp()),
  //   ),
  // );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageAsync = ref.watch(languageProvider);

    return languageAsync.when(
      data: (languageState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "RPP",
          locale: languageState.locale,
          initialRoute: Routes.splash,
          onGenerateRoute: Routes.onGenerateRouted,
          supportedLocales: const [
            Locale('en'),
            Locale('ne'),
          ],
          localeResolutionCallback: (locale, supportedLocales) {
            if (locale != null) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode == locale.languageCode) {
                  return supportedLocale;
                }
              }
            }
            return const Locale('ne');
          },
          localizationsDelegates: const [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            // Wrap MaterialApp content with NetworkStatusWidget and DevicePreview
            final devicePreviewChild = DevicePreview.appBuilder(context, child);
            return NetworkStatusWidget(child: devicePreviewChild!);
          },
        );
      },
      loading: () => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
      ),
      error: (error, stack) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(child: Text('Error loading language')),
        ),
      ),
    );
  }
}
