import 'package:flutter/material.dart';
import 'package:raparva_app/core/utils/api_helper.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/full_screen_image_view.dart';

class GalleryViewScreen extends StatelessWidget {
  final List<int> galleryIds;
  final String title;

  const GalleryViewScreen({
    super.key,
    required this.galleryIds,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40), // Top space added
      child: GridView.builder(
        padding: const EdgeInsets.all(12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: galleryIds.length,
        itemBuilder: (context, index) {
          final imgId = galleryIds[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FullScreenImageView(imageId: imgId),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                getSliderThumbUrl(imgId),
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[800],
                  child: const Icon(Icons.broken_image, color: Colors.white54),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
