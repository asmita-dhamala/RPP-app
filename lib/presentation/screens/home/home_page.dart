import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/articles.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/news_list_screen.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/photo_gallery_screen_widget.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/video_gallery_screen.dart';
import 'package:raparva_app/presentation/screens/home/chairman/chairman.dart';
import 'package:raparva_app/presentation/screens/home/app_bar/custom_app_bar.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/navigation_bar.dart';
import 'package:raparva_app/presentation/screens/home/join_now/join_now_button.dart';
import 'package:raparva_app/presentation/screens/home/swipper_slider/swipper_slider.dart';
import 'package:raparva_app/presentation/screens/info_center_screen/info_center_section.dart';
import 'package:raparva_app/provider/join_now_provider.dart';
import 'package:raparva_app/provider/news_provider.dart';
import 'package:raparva_app/provider/info_center_provider.dart'; // 🔄 Add this

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const int photoGalleryCrossAxisCount = 3;
  static const double photoGalleryItemHeight = 100;
  static const double photoGalleryMainAxisSpacing = 8;

  static const int videoGalleryCrossAxisCount = 3;
  static const double videoGalleryItemHeight = 100;
  static const double videoGalleryMainAxisSpacing = 8;

  static const int newsListCrossAxisCount = 1;
  static const double newsListItemHeight = 100;
  static const double newsListMainAxisSpacing = 8;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(membershipProvider);
    final currentUserIdentity = currentUser.mobile ?? '';
    final screenWidth = MediaQuery.of(context).size.width;

    final int photoGalleryItemCount = 9;
    final int videoGalleryItemCount = 6;
    final int newsListItemCount = 5;

    double calculateGridHeight({
      required int itemCount,
      required int crossAxisCount,
      required double itemHeight,
      required double mainAxisSpacing,
    }) {
      int rowCount = (itemCount / crossAxisCount).ceil();
      return rowCount * itemHeight + (rowCount - 1) * mainAxisSpacing;
    }

    final photoGalleryHeight = calculateGridHeight(
      itemCount: photoGalleryItemCount,
      crossAxisCount: photoGalleryCrossAxisCount,
      itemHeight: photoGalleryItemHeight,
      mainAxisSpacing: photoGalleryMainAxisSpacing,
    );

    final videoGalleryHeight = calculateGridHeight(
      itemCount: videoGalleryItemCount,
      crossAxisCount: videoGalleryCrossAxisCount,
      itemHeight: videoGalleryItemHeight,
      mainAxisSpacing: videoGalleryMainAxisSpacing,
    );

    final newsListHeight = calculateGridHeight(
      itemCount: newsListItemCount,
      crossAxisCount: newsListCrossAxisCount,
      itemHeight: newsListItemHeight,
      mainAxisSpacing: newsListMainAxisSpacing,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(screenWidth: screenWidth),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SwipperSliderWidget(),
                  SizedBox(height: _getMainSpacing(screenWidth)),

                  // 🔄 UPDATED: Info Center (from provider)
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _getHorizontalPadding(screenWidth),
                    ),
                    child: ref.watch(infoCenterProvider).when(
                      data: (data) {
                        if (data == null) return const SizedBox.shrink();
                        return InfoCenterContent(data: data);
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(
                        child: Text('Error loading Info Center: $error'),
                      ),
                    ),
                  ),

                  SizedBox(height: _getMainSpacing(screenWidth)),
                  const StaticBannerScreen(),
                  SizedBox(height: _getMainSpacing(screenWidth)),

                  // 🔄 News Section
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _getHorizontalPadding(screenWidth),
                    ),
                    child: ref.watch(newsListProvider).when(
                      data: (data) {
                        return SizedBox(
                          child: NewsListScreen(data: data!),
                        );
                      },
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (error, stack) => Center(child: Text('Error: $error')),
                    ),
                  ),

                  SizedBox(height: _getMainSpacing(screenWidth)),

                  // 🔄 Photo Gallery Section
                  SizedBox(
                    height: photoGalleryHeight,
                    child: const PhotoGalleryWidget(),
                  ),

                  const AlekhV2Widget(),

                  // 🔄 Video Gallery Section
                  SizedBox(
                    child: const VideoGallerySection(),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: _getHorizontalPadding(screenWidth),
                    ),
                    child: const SizedBox(),
                  ),
                ],
              ),
            ),
          ),

          // Join Now Button
          if (currentUserIdentity.isEmpty || currentUserIdentity == '0')
            Positioned(bottom: 16, right: 16, child: const JoinNow()),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        screenWidth: screenWidth,
        activeTab: 'home',
        onTap: (key) {
          if (key == 'home') return;
          Navigator.pushNamed(context, '/$key');
        },
      ),
    );
  }

  double _getHorizontalPadding(double screenWidth) {
    if (screenWidth > 1200) return 64.0;
    if (screenWidth > 600) return 32.0;
    return (screenWidth * 0.043).clamp(12.0, 20.0);
  }

  double _getMainSpacing(double screenWidth) {
    if (screenWidth > 1200) return 48.0;
    if (screenWidth > 600) return 32.0;
    return (screenWidth * 0.064).clamp(20.0, 28.0);
  }
}
