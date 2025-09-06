// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:raparva_app/core/constants/app_color.dart';
// import 'package:raparva_app/core/languages/lang_translate.dart';
// import 'package:raparva_app/presentation/screens/home/all_home_card_screen/photo_gallery_screen_widget.dart';
// import 'package:url_launcher/url_launcher.dart';

// class Menubar extends StatelessWidget {
//   const Menubar({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Material(
//       color: Colors.transparent, // ✅ Transparent full-screen overlay
//       child: Row(
//         children: [
//           // 👉 Sidebar (80% of screen width)
//           SizedBox(
//             width: screenWidth * 0.8,
//             child: Drawer(
//               elevation: 0,
//               child: SafeArea(
//                 child: Column(
//                   children: [
//                     const SizedBox(height: 16),
//                     Image.asset('assets/images/app_logo.png', height: 80),
//                     Text(
//                       UiUtills.translate(context, 'rpp'),
//                       style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: themered,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     const Divider(),

//                     // 🔽 Scrollable menu list
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             _buildDrawerItem(context, Icons.home, 'home'),
//                             _buildDrawerItem(
//                               context,
//                               Icons.people,
//                               'the_party',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.person,
//                               'leadership',
//                             ),
//                             _buildDrawerItem(context, Icons.groups, 'morcha'),
//                             _buildDrawerItem(
//                               context,
//                               Icons.perm_media,
//                               'media_resources',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.photo_album,
//                               'Photo Gallery',
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder:
//                                         (_) =>
//                                             const PhotoGalleryWidget(), // or GalleryViewScreen if using it
//                                   ),
//                                 );
//                               },
//                             ),

//                             _buildDrawerItem(
//                               context,
//                               Icons.menu_book,
//                               'literature',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.event,
//                               'upcoming_events',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.timeline,
//                               'our_journey',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.live_tv,
//                               'rpp_live',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.group_add,
//                               'join_rpp',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.volunteer_activism,
//                               'make_donation',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.group,
//                               'join_volunteer',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.contact_mail,
//                               'contact_us',
//                             ),
//                             _buildDrawerItem(
//                               context,
//                               Icons.settings,
//                               'settings',
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),

//                     const Divider(),

//                     // 📱 Social Media Icons
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0,
//                         vertical: 8,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           _buildSocialIcon(
//                             FontAwesomeIcons.facebook,
//                             'https://www.facebook.com/RppforNepal/',
//                             Colors.blue,
//                           ),
//                           _buildSocialIcon(
//                             FontAwesomeIcons.twitter,
//                             'https://x.com/RPPforNepal',
//                             Colors.black,
//                           ),
//                           _buildSocialIcon(
//                             FontAwesomeIcons.youtube,
//                             'https://www.youtube.com/@rppfornepal-2048',
//                             Colors.red,
//                           ),
//                           _buildSocialIcon(
//                             FontAwesomeIcons.instagram,
//                             'https://www.instagram.com/rppfornepal/',
//                             Colors.purple,
//                           ),
//                           _buildSocialIcon(
//                             FontAwesomeIcons.whatsapp,
//                             'https://wa.me/+9779851347405', // e.g., https://wa.me/9779812345678
//                             Colors.green,
//                           ),
//                           _buildSocialIcon(
//                             FontAwesomeIcons.tiktok,
//                             'https://www.tiktok.com/@rppfornepal?is_from_webapp=1&sender_device=pc ', // Replace with your actual TikTok URL
//                             Colors.black,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),

//           // 👉 Transparent area to close menu
//           Expanded(
//             child: GestureDetector(
//               onTap: () => Navigator.pop(context), // ✅ Close on tap outside
//               child: Container(color: Colors.transparent),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildDrawerItem(BuildContext context, IconData icon, String key) {
//     return ListTile(
//       leading: Icon(icon, color: themered),
//       title: Text(UiUtills.translate(context, key)),
//       trailing: const Icon(Icons.chevron_right),
//       onTap: () {
//         Navigator.pop(context); // ✅ Close menu
//         // TODO: Add navigation logic here
//       },
//     );
//   }
// }

// Widget _buildSocialIcon(IconData icon, String url, Color color) {
//   return GestureDetector(
//     onTap: () async {
//       final uri = Uri.parse(url);
//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//       }
//     },
//     child: FaIcon(icon, color: color),
//   );
// }





import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/core/languages/lang_translate.dart';
import 'package:raparva_app/presentation/screens/home/all_home_card_screen/photo_gallery_screen_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Menubar extends StatelessWidget {
  const Menubar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: Row(
        children: [
          // Sidebar (80%)
          SizedBox(
            width: screenWidth * 0.8,
            child: Drawer(
              elevation: 0,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Image.asset('assets/images/app_logo.png', height: 80),
                    Text(
                      UiUtills.translate(context, 'rpp'),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: themered,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(),

                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            _buildDrawerItem(context, Icons.home, 'home'),
                            _buildDrawerItem(context, Icons.people, 'the_party'),
                            _buildDrawerItem(context, Icons.person, 'leadership'),
                            _buildDrawerItem(context, Icons.groups, 'morcha'),
                            _buildDrawerItem(context, Icons.perm_media, 'media_resources'),

                            // ✅ Photo Gallery navigation
                            _buildDrawerItem(
                              context,
                              Icons.photo_album,
                              'Photo Gallery',
                              onTap: () {
                                Navigator.pop(context); // Close drawer first
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const PhotoGalleryWidget(),
                                  ),
                                );
                              },
                            ),

                            _buildDrawerItem(context, Icons.menu_book, 'literature'),
                            _buildDrawerItem(context, Icons.event, 'upcoming_events'),
                            _buildDrawerItem(context, Icons.timeline, 'our_journey'),
                            _buildDrawerItem(context, Icons.live_tv, 'rpp_live'),
                            _buildDrawerItem(context, Icons.group_add, 'join_rpp'),
                            _buildDrawerItem(context, Icons.volunteer_activism, 'make_donation'),
                            _buildDrawerItem(context, Icons.group, 'join_volunteer'),
                            _buildDrawerItem(context, Icons.contact_mail, 'contact_us'),
                            _buildDrawerItem(context, Icons.settings, 'settings'),
                          ],
                        ),
                      ),
                    ),

                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildSocialIcon(FontAwesomeIcons.facebook, 'https://www.facebook.com/RppforNepal/', Colors.blue),
                          _buildSocialIcon(FontAwesomeIcons.twitter, 'https://x.com/RPPforNepal', Colors.black),
                          _buildSocialIcon(FontAwesomeIcons.youtube, 'https://www.youtube.com/@rppfornepal-2048', Colors.red),
                          _buildSocialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/rppfornepal/', Colors.purple),
                          _buildSocialIcon(FontAwesomeIcons.whatsapp, 'https://wa.me/+9779851347405', Colors.green),
                          _buildSocialIcon(FontAwesomeIcons.tiktok, 'https://www.tiktok.com/@rppfornepal?is_from_webapp=1&sender_device=pc', Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Transparent area to close menu
          Expanded(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }

  // ✅ Updated to accept optional onTap
  Widget _buildDrawerItem(
    BuildContext context,
    IconData icon,
    String key, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: themered),
      title: Text(UiUtills.translate(context, key)),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap ??
          () {
            Navigator.pop(context); // default behavior
          },
    );
  }
}

Widget _buildSocialIcon(IconData icon, String url, Color color) {
  return GestureDetector(
    onTap: () async {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    },
    child: FaIcon(icon, color: color),
  );
}
