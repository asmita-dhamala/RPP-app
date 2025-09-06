import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/provider/swipper_slider_provider.dart';

class SwipperSliderWidget extends ConsumerWidget {
  const SwipperSliderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final swipperSliderAsync = ref.watch(swipperSliderProvider);

    final screenWidth = MediaQuery.of(context).size.width;

    return swipperSliderAsync.when(
      data: (slider) {
        if (slider == null || slider.model.listItem.isEmpty) {
          return const SizedBox.shrink();
        }

        return SizedBox(
          width: double.infinity,
          height: screenWidth, // Height = screen width for 1:1 ratio
          child: PageView.builder(
            itemCount: slider.model.listItem.length,
            itemBuilder: (context, index) {
              final item = slider.model.listItem[index];

              return Image.network(
                'https://rpp.org.np/media/preview/${item.bgImage}/thumb',
                width: screenWidth,
                height: screenWidth,
                fit: BoxFit.cover,  // fills square nicely, cropping if needed
                errorBuilder: (_, __, ___) =>
                    const Center(child: Icon(Icons.broken_image)),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        );
      },
      loading: () => const SizedBox(
        height: 200,
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (err, stack) => SizedBox(
        height: 200,
        child: Center(child: Text('Error: $err')),
      ),
    );
  }
}
