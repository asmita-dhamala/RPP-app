// Example: video_page.dart
import 'package:flutter/material.dart';
import 'package:raparva_app/core/utils/navigation_helper.dart';
import 'package:raparva_app/presentation/screens/home/all_navigation_bar/navigation_bar.dart';

class MyRppPage extends StatelessWidget {
  const MyRppPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text('My Rpp')),
      body: const Center(child: Text('My Rpp Page Content')),
      bottomNavigationBar: CustomNavigationBar(
        screenWidth: screenWidth,
        activeTab: 'my_rpp',
        onTap: (key) {
          navigateToTab(context, key, 'my_rpp');
        },
      ),
    );
  }
}
