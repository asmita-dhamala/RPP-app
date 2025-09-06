import 'package:flutter/material.dart'; 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/core/languages/lang_translate.dart';
import 'package:raparva_app/core/languages/language_provider.dart';
import 'package:raparva_app/presentation/screens/home/app_bar/menubar.dart';
import 'package:raparva_app/presentation/screens/home/app_bar/notifications_page.dart';
import 'package:raparva_app/presentation/screens/home/app_bar/search_page.dart';

class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  final double screenWidth;

  const CustomAppBar({super.key, required this.screenWidth});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageAsync = ref.watch(languageProvider);

    return languageAsync.when(
      data: (languageState) {
        final currentLang = languageState.languageCode;

        return AppBar(
          backgroundColor: themeblue,
          elevation: 0,
          centerTitle: false,
          toolbarHeight: _getAppBarHeight(screenWidth),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: _getIconSize(screenWidth),
              ),
              onPressed: () {
                // ✅ Updated to use overlay dialog for Menubar
                showDialog(
                  context: context,
                  barrierColor: Colors.transparent,
                  barrierDismissible: true,
                  builder: (_) => const Menubar(),
                );
              },
              tooltip: 'Open Menu',
            ),
          ),
          title: Text(
            UiUtills.translate(context, 'RPP'),
            style: TextStyle(
              color: Colors.white,
              fontSize: _getTitleSize(screenWidth),
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            _buildIconButton(
              context,
              icon: Icons.search,
              tooltip: 'Search',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchPage()),
              ),
            ),
            _buildLanguagePopup(context, ref, currentLang),
            _buildIconButton(
              context,
              icon: Icons.notifications,
              tooltip: 'Notifications',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationsPage()),
              ),
            ),
            const SizedBox(width: 8),
          ],
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (e, _) => AppBar(title: const Text('Error')),
    );
  }

  Widget _buildIconButton(
    BuildContext context, {
    required IconData icon,
    required String tooltip,
    required VoidCallback onTap,
  }) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: _getIconSize(screenWidth)),
      tooltip: tooltip,
      onPressed: onTap,
      padding: EdgeInsets.symmetric(horizontal: _getIconPadding(screenWidth)),
      visualDensity: VisualDensity.compact,
    );
  }

  Widget _buildLanguagePopup(
    BuildContext context,
    WidgetRef ref,
    String currentLang,
  ) {
    return PopupMenuButton<String>(
      icon: Icon(
        Icons.language,
        color: Colors.white,
        size: _getIconSize(screenWidth),
      ),
      onSelected: (langCode) {
        bool isRTL = langCode == 'ar'; // Optional RTL
        ref.read(languageProvider.notifier).setLanguage(langCode, isRTL);
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'en',
          child: Text('English', style: TextStyle(color: Colors.black)),
        ),
        const PopupMenuItem(
          value: 'ne',
          child: Text('नेपाली', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  double _getAppBarHeight(double width) =>
      width >= 1200 ? 72 : width >= 800 ? 64 : 56;

  double _getTitleSize(double width) =>
      width >= 1200 ? 24 : width >= 800 ? 22 : (width * 0.05).clamp(16.0, 20.0);

  double _getIconSize(double width) =>
      width >= 1200 ? 26 : width >= 800 ? 24 : (width * 0.055).clamp(18.0, 24.0);

  double _getIconPadding(double width) => width >= 800 ? 8 : 6;

  @override
  Size get preferredSize => Size.fromHeight(_getAppBarHeight(screenWidth));
}
