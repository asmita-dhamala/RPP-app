import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/core/utils/api_helper.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/photo_gallery_view_screen.dart';
import 'package:raparva_app/provider/photo_gallery_provider.dart';

class PhotoGalleryWidget extends ConsumerStatefulWidget {
  final String? sectionTitle;

  const PhotoGalleryWidget({super.key, this.sectionTitle});

  @override
  ConsumerState<PhotoGalleryWidget> createState() => _PhotoGalleryWidgetState();
}

class _PhotoGalleryWidgetState extends ConsumerState<PhotoGalleryWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Size _getCardSize(double screenWidth) {
    if (screenWidth >= 1200) {
      return const Size(350, 240); // Desktop
    } else if (screenWidth >= 800) {
      return const Size(320, 220); // Tablet
    } else {
      return const Size(280, 210); // Mobile
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncGallery = ref.watch(photoGalleryProvider);

    return asyncGallery.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
      data: (response) {
        final items = response.data;

        if (items.isEmpty) {
          return const Center(child: Text('No images found'));
        }

        final categoryName = items.first.categoryName;
        final sectionTitle = widget.sectionTitle ?? categoryName;

        final screenWidth = MediaQuery.of(context).size.width;
        final cardSize = _getCardSize(screenWidth);
        final cardWidth = cardSize.width;
        final cardHeight = cardSize.height;
        const spacing = 16.0;

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (sectionTitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    sectionTitle,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              SizedBox(
                height: cardHeight,
                child: ListView.separated(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(width: spacing),
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GalleryViewScreen(
                              galleryIds: item.galleryIds,
                              title: item.title,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: SizedBox(
                          width: cardWidth,
                          height: cardHeight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: cardHeight * 0.50,
                                width: double.infinity,
                                child: Image.network(
                                  getSliderThumbUrl(item.imageId),
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, __, ___) => Container(
                                    color: Colors.grey.shade300,
                                    child: const Icon(Icons.broken_image, size: 50),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(height: 4),
                                    if (item.publisher.isNotEmpty)
                                      Text(
                                        item.publisher,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(color: Colors.grey[600]),
                                      ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
