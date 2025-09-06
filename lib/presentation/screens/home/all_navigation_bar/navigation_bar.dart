import 'package:flutter/material.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/core/languages/lang_translate.dart';
import 'package:share_plus/share_plus.dart'; // <-- ADD THIS

class CustomNavigationBar extends StatelessWidget {
  final double screenWidth;
  final String activeTab;
  final Function(String key) onTap;

  const CustomNavigationBar({
    super.key,
    required this.screenWidth,
    required this.activeTab,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _getBottomNavHeight(screenWidth),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildBottomNavItem(context, Icons.home, 'home'),
          _buildBottomNavItem(context, Icons.play_arrow, 'video'),
          _buildBottomNavItem(context, Icons.person, 'my_rpp'),
          _buildBottomNavItem(context, Icons.live_tv, 'rpp_live'),
          _buildBottomNavItem(context, Icons.share, 'share'),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(BuildContext context, IconData icon, String key) {
    final isActive = key == activeTab;

    return GestureDetector(
      onTap: () {
        if (key == 'share') {
          // 👉 Launch system native share dialog
          Share.share(
            'Download RPP Mobile Application\nhttps://play.google.com/store/apps/details?id=com.rpp.mobile',
            subject: 'RPP Official App',
          );
        } else {
          onTap(key); // Normal behavior
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: _getBottomNavHorizontalPadding(screenWidth)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? themered : themeblue.withOpacity(0.4),
              size: _getBottomNavIconSize(screenWidth),
            ),
            SizedBox(height: _getBottomNavIconTextSpacing(screenWidth)),
            Text(
              UiUtills.translate(context, key),
              style: TextStyle(
                color: isActive ? themered : themeblue.withOpacity(0.4),
                fontSize: _getBottomNavFontSize(screenWidth),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Responsive methods
  double _getBottomNavHeight(double screenWidth) {
    if (screenWidth > 1200) return 85.0;
    if (screenWidth > 600) return 80.0;
    return 70.0;
  }

  double _getBottomNavIconSize(double screenWidth) {
    if (screenWidth > 1200) return 32.0;
    if (screenWidth > 600) return 30.0;
    return (screenWidth * 0.064).clamp(20.0, 26.0);
  }

  double _getBottomNavFontSize(double screenWidth) {
    if (screenWidth > 1200) return 14.0;
    if (screenWidth > 600) return 14.0;
    return (screenWidth * 0.029).clamp(9.0, 12.0);
  }

  double _getBottomNavIconTextSpacing(double screenWidth) {
    if (screenWidth > 600) return 6.0;
    return 4.0;
  }

  double _getBottomNavHorizontalPadding(double screenWidth) {
    if (screenWidth > 1200) return 20.0;
    if (screenWidth > 600) return 20.0;
    return (screenWidth * 0.032).clamp(8.0, 16.0);
  }
}
