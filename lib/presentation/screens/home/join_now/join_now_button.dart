// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:raparva_app/core/constants/colors.dart';
// import 'package:raparva_app/provider/join_now_provider.dart';
// import 'join_now_screen.dart';

// class JoinNow extends ConsumerWidget {
//   const JoinNow({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final joinStatusAsync = ref.watch(userJoinStatusProvider);

//     return joinStatusAsync.when(
//       data: (joined) {
//         if (joined) return const SizedBox.shrink();

//         return Positioned(
//           bottom: 30,
//           right: 16,
//           child: FloatingActionButton.extended(
//             backgroundColor: themered,
//             icon: Icon(Icons.person_add_alt_1, color: themewhite),
//             label: Text('Join Now', style: TextStyle(color: themewhite)),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const JoinNowScreen()),
//               );
//             },
//           ),
//         );
//       },
//       loading: () => const SizedBox.shrink(),
//       error: (_, __) => const SizedBox.shrink(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/presentation/screens/home/join_now/join_now_screen.dart';
import 'package:raparva_app/provider/join_now_provider.dart';

class JoinNow extends ConsumerWidget {
  const JoinNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch some user membership state to decide button visibility or loading
    final isMember = ref.watch(membershipProvider);

    // If user is already a member, no button
    if (isMember == true) return const SizedBox.shrink();

    return Positioned(
      bottom: 30,
      right: 16,
      child: FloatingActionButton.extended(
        backgroundColor: themered,
        icon: const Icon(Icons.person_add_alt_1, color: Colors.white),
        label: const Text('Join Now', style: TextStyle(color: Colors.white)),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const JoinNowScreen()),
          );
        },
      ),
    );
  }
}
