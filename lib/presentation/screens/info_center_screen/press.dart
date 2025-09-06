import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/data/models/info_center_model.dart';
import 'package:raparva_app/data/models/press_model.dart';
import 'package:raparva_app/provider/press_provider.dart';




// Main UI Screen
class InfoCardPress extends ConsumerWidget {
  const InfoCardPress({super.key, required InfoCenterItem item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pressAsyncValue = ref.watch(pressReleaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Press Releases'),
      ),
      body: pressAsyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error: $e')),
        data: (pressReleases) {
          if (pressReleases.isEmpty) {
            return const Center(child: Text('No press releases found.'));
          }

          return ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: pressReleases.length,
            itemBuilder: (context, index) {
              final item = pressReleases[index];
              return PressReleaseCard(item: item);
            },
          );
        },
      ),
    );
  }
}

// Press Release Card Widget
class PressReleaseCard extends StatelessWidget {
  final PressReleaseModel item;

  const PressReleaseCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: InkWell(
        onTap: () {
          // Navigate to details or open URL
          // Example:
          // launchUrl(Uri.parse(item.url));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (item.imageUrl.isNotEmpty)
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  item.imageUrl,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(height: 180, child: Center(child: Icon(Icons.broken_image))),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.publisher,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.createdAt,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
