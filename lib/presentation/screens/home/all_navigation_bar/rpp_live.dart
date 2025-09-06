
// Example: video_page.dart
import 'package:flutter/material.dart';
import 'package:raparva_app/core/utils/navigation_helper.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/navigation_bar.dart';

class RppLivePage extends StatelessWidget {
  const RppLivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('RPP Live')),
      body: const Center(child: Text('RPP Live Page Content')),
      bottomNavigationBar: CustomNavigationBar(
        screenWidth: screenWidth,
        activeTab: 'rpp_live',
        onTap: (key) {
          navigateToTab(context, key, 'rpp_live');
        },
      ),
    );
  }
}
