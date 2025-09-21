// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter_arc_text/flutter_arc_text.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:raparva_app/core/constants/app_color.dart';
// import 'package:raparva_app/core/languages/lang_translate.dart';
// import 'package:raparva_app/routing/app_routes.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen>
//     with SingleTickerProviderStateMixin {
//   late final AnimationController _controller;
//   final AudioPlayer _audioPlayer = AudioPlayer();

//   @override
//   void initState() {
//     super.initState();

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 6),
//     )..repeat();

//     _playAudio();

//     Future.delayed(const Duration(seconds: 5), () {
//       if (mounted) {
//         Navigator.pushReplacementNamed(context, Routes.home);
//       }
//     });
//   }

//   Future<void> _playAudio() async {
//     try {
//       await _audioPlayer.play(AssetSource('audio/sankha.mp3'));
//       await Future.delayed(const Duration(seconds: 4));
//       await _audioPlayer.stop();
//     } catch (e) {
//       debugPrint("Audio play error: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _audioPlayer.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedBuilder(
//         animation: _controller,
//         builder: (_, __) {
//           final double scale = 1 + 0.08 * sin(_controller.value * 2 * pi);
//           final double rotate = sin(_controller.value * pi) * 0.12; // bounce tilt
//           final double shimmer = (0.5 + 0.5 * sin(_controller.value * 2 * pi));
//           final double textRotate = _controller.value * 2 * pi; // arc text rotation

//           return Container(
//             decoration: BoxDecoration(
//               gradient: RadialGradient(
//                 colors: [
//                   themeblue.withOpacity(0.9),
//                   Colors.deepPurple.shade700,
//                   Colors.black,
//                 ],
//                 center: const Alignment(0, -0.3),
//                 radius: 1.2,
//               ),
//             ),
//             child: Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   // Multi-layer glowing halo
//                   CustomPaint(
//                     painter: HaloPainter(_controller.value),
//                     child: const SizedBox(width: 340, height: 340),
//                   ),

//                   // Animated logo with scale + bounce + tilt
//                   Transform.scale(
//                     scale: scale,
//                     child: Transform.rotate(
//                       angle: rotate,
//                       child: Image.asset(
//                         'assets/images/app_logo.png',
//                         width: 190,
//                         height: 190,
//                       ),
//                     ),
//                   ),

//                   // Rotating Arc Nepali text (counterClockwise, no gap, shimmer)
//                   Transform.rotate(
//                     angle: -textRotate, // rotate anticlockwise
//                     child: ShaderMask(
//                       shaderCallback: (bounds) => LinearGradient(
//                         colors: [
//                           Colors.white,
//                           Colors.yellowAccent.withOpacity(0.8),
//                           Colors.white,
//                         ],
//                         stops: [0.2, shimmer, 0.8],
//                       ).createShader(bounds),
//                       blendMode: BlendMode.srcIn,
//                       child: SizedBox(
//                         width: 280,
//                         height: 140,
//                         child: ArcText(
//                           radius: 120,
//                           startAngle: -pi / 2,
//                           direction: Direction.counterClockwise, // right-to-left
//                           placement: Placement.inside,
//                           text: UiUtills.translate(context, 'rpp'),
//                           textStyle: GoogleFonts.notoSerifDevanagari(
//                             fontSize: 28,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             letterSpacing: 0, // no gap
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

//                   // Loading dots wave animation
//                   Positioned(
//                     bottom: 40,
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: List.generate(3, (i) {
//                         final double offset =
//                             sin((_controller.value * 2 * pi) - (i * 0.8));
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 2),
//                           child: Transform.translate(
//                             offset: Offset(0, offset * 6),
//                             child: Text(
//                               ".",
//                               style: GoogleFonts.poppins(
//                                 fontSize: 28,
//                                 fontWeight: FontWeight.w600,
//                                 color: Colors.white.withOpacity(0.9),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// // Enhanced glowing halo painter
// class HaloPainter extends CustomPainter {
//   final double animationValue;
//   HaloPainter(this.animationValue);

//   @override
//   void paint(Canvas canvas, Size size) {
//     final double radius = min(size.width, size.height) / 2;
//     final double glowRadius = radius + (15 * sin(animationValue * 2 * pi));

//     final Paint paint = Paint()
//       ..shader = RadialGradient(
//         colors: [
//           Colors.yellowAccent.withOpacity(0.6),
//           Colors.orangeAccent.withOpacity(0.3),
//           Colors.transparent,
//         ],
//       ).createShader(
//         Rect.fromCircle(center: Offset(radius, radius), radius: glowRadius),
//       );

//     canvas.drawCircle(Offset(radius, radius), glowRadius, paint);
//   }

//   @override
//   bool shouldRepaint(covariant HaloPainter oldDelegate) =>
//       oldDelegate.animationValue != animationValue;
// }


































import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:raparva_app/core/constants/app_color.dart';
import 'package:raparva_app/core/languages/lang_translate.dart';
import 'package:raparva_app/routing/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();

    _playAudio();

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacementNamed(context, Routes.home);
      }
    });
  }

  Future<void> _playAudio() async {
    try {
      await _audioPlayer.play(AssetSource('audio/sankha.mp3'));
      await Future.delayed(const Duration(seconds: 4));
      await _audioPlayer.stop();
    } catch (e) {
      debugPrint("Audio play error: $e");
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (_, __) {
          final double scale = 1 + 0.08 * sin(_controller.value * 2 * pi);
          final double rotate = sin(_controller.value * pi) * 0.12; // bounce tilt
          final double shimmer = (0.5 + 0.5 * sin(_controller.value * 2 * pi));
          final double textRotate = _controller.value * 2 * pi; // arc text rotation

          return Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  themeblue.withOpacity(0.9),
                  Colors.deepPurple.shade700,
                  Colors.black,
                ],
                center: const Alignment(0, -0.3),
                radius: 1.2,
              ),
            ),
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Multi-layer glowing halo
                  CustomPaint(
                    painter: HaloPainter(_controller.value),
                    child: const SizedBox(width: 340, height: 340),
                  ),

                  // Animated logo with scale + bounce + tilt
                  Transform.scale(
                    scale: scale,
                    child: Transform.rotate(
                      angle: rotate,
                      child: Image.asset(
                        'assets/images/app_logo.png',
                        width: 190,
                        height: 190,
                      ),
                    ),
                  ),

                  // Rotating Arc Nepali text (counterClockwise, no gap, shimmer)
                  Transform.rotate(
                    angle: -textRotate, // rotate anticlockwise
                    child: ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.yellowAccent.withOpacity(0.8),
                          Colors.white,
                        ],
                        stops: [0.2, shimmer, 0.8],
                      ).createShader(bounds),
                      blendMode: BlendMode.srcIn,
                      child: SizedBox(
                        width: 280,
                        height: 140,
                        child: ArcText(
                          radius: 120,
                          startAngle: -pi / 2,
                          direction: Direction.counterClockwise, // right-to-left
                          placement: Placement.inside,
                          text: UiUtills.translate(context, 'rpp'),
                          textStyle: GoogleFonts.notoSerifDevanagari(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 0, // no gap
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Enhanced glowing halo painter
class HaloPainter extends CustomPainter {
  final double animationValue;
  HaloPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width, size.height) / 2;
    final double glowRadius = radius + (15 * sin(animationValue * 2 * pi));

    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.yellowAccent.withOpacity(0.6),
          Colors.orangeAccent.withOpacity(0.3),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(center: Offset(radius, radius), radius: glowRadius),
      );

    canvas.drawCircle(Offset(radius, radius), glowRadius, paint);
  }

  @override
  bool shouldRepaint(covariant HaloPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
