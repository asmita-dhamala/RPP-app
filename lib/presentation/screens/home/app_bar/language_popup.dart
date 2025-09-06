import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/core/languages/language_provider.dart';

class LanguagePopup extends ConsumerWidget {
  const LanguagePopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageState = ref.watch(languageProvider);

    return languageState.when(
      data: (lang) {
        final currentLang = lang.languageCode;

        return PopupMenuButton<String>(
          tooltip: 'Select Language',
          icon: const Icon(Icons.language, color: Colors.white),
          onSelected: (String code) async {
            // Detect RTL language if needed (optional)
            final isRTL = (code == 'ar'); 

            // ✅ Change language using your provider (and Hive)
            await ref
                .read(languageProvider.notifier)
                .setLanguage(code, isRTL);

            // Optional: Rebuild widget tree
            (context as Element).markNeedsBuild();
          },
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'ne',
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: currentLang == 'ne' ? Colors.blue : Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  const Text('नेपाली'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'en',
              child: Row(
                children: [
                  Icon(
                    Icons.language,
                    color: currentLang == 'en' ? Colors.blue : Colors.black54,
                  ),
                  const SizedBox(width: 8),
                  const Text('English'),
                ],
              ),
            ),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, _) => const Icon(Icons.error, color: Colors.red),
    );
  }
}
