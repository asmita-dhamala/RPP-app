import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/provider/articles_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AlekhV2Widget extends ConsumerWidget {
  const AlekhV2Widget({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final alekhAsync = ref.watch(alekhV2Provider);

    return alekhAsync.when(
      data: (alekh) {
        if (alekh == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (alekh.model.title.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  alekh.model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: alekh.model.articles.length,
              itemBuilder: (context, index) {
                final article = alekh.model.articles[index];
                final imageUrl =
                    'https://rpp.org.np/media/preview/${article.image}/thumb';

                return ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  leading: ClipOval(
                    child: Image.network(
                      imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          const Icon(Icons.broken_image, size: 60),
                    ),
                  ),
                  title: Text(article.title),
                  subtitle: Text(article.author),
                  onTap: () => _launchUrl(article.link),
                );
              },
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
    );
  }
}
