import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:raparva_app/data/models/chairman_model.dart';
import 'package:raparva_app/provider/chairman_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class StaticBannerScreen extends ConsumerWidget {
  const StaticBannerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final staticBannerAsync = ref.watch(staticBannerProvider);
    final screenWidth = MediaQuery.of(context).size.width;

    final double horizontalPadding = screenWidth >= 1000
        ? 120
        : screenWidth >= 600
            ? 48
            : 20;

    // We remove fixed height and use AspectRatio to keep image proportion
    // This prevents cropping and keeps image responsive
    final double imageAspectRatio = 16 / 9; // Adjust to your image ratio if needed

    final double titleFontSize = screenWidth >= 1000
        ? 30
        : screenWidth >= 600
            ? 24
            : 20;

    final double subtitleFontSize = screenWidth >= 1000
        ? 20
        : screenWidth >= 600
            ? 18
            : 16;

    final double htmlFontSize = screenWidth >= 1000
        ? 18
        : screenWidth >= 600
            ? 16
            : 14;

    return staticBannerAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error: $err')),
      data: (banner) {
        if (banner == null || banner.model.listItem.isEmpty) {
          return const Center(child: Text('No banner found.'));
        }

        final StaticBannerItem item = banner.model.listItem.first;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Full Width Banner Image with AspectRatio for no cropping
              if (item.avatar != 0)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: AspectRatio(
                    aspectRatio: imageAspectRatio,
                    child: Image.network(
                      item.avatarUrl,
                      width: double.infinity,
                      fit: BoxFit.contain, // Use contain to avoid cropping
                      errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                    ),
                  ),
                ),

              const SizedBox(height: 24),

              // Title and Subtitle
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    if (item.subtitle.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: subtitleFontSize,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // HTML Description
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Html(
                  data: item.description,
                  style: {
                    "body": Style(
                      fontSize: FontSize(htmlFontSize),
                      lineHeight: LineHeight.number(1.7),
                      color: Colors.black87,
                    ),
                    "p": Style(margin: Margins.only(bottom: 12)),
                  },
                ),
              ),

              const SizedBox(height: 24),

              // Buttons
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    if (item.readMoreLink.isNotEmpty)
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () => _launchURL(item.readMoreLink),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          icon: const Icon(Icons.open_in_new),
                          label: Text(item.readMoreText),
                        ),
                      ),
                    if (item.readMoreLink2.isNotEmpty) ...[
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () => _launchURL(item.readMoreLink2),
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            side: const BorderSide(color: Colors.orange),
                          ),
                          icon: const Icon(Icons.person_add),
                          label: Text(
                            item.readMoreText2,
                            style: const TextStyle(color: Colors.orange),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        );
      },
    );
  }

  void _launchURL(String url) async {
    final uri = Uri.tryParse(url);
    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }
}
