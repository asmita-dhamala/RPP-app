import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
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
      duration: const Duration(seconds: 5),
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

      // Wait for 4 seconds
      await Future.delayed(const Duration(seconds: 4));

      // Stop the audio
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
      backgroundColor: themeblue,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (_, __) {
            final double scale = 1 + 0.05 * sin(_controller.value * 2 * pi);

            return Stack(
              alignment: Alignment.center,
              children: [
                // Glowing animated halo
                CustomPaint(
                  painter: HaloPainter(_controller.value),
                  child: const SizedBox(width: 300, height: 300),
                ),

                // Zooming logo
                Transform.scale(
                  scale: scale,
                  child: Image.asset(
                    'assets/images/app_logo.png',
                    width: 180,
                    height: 180,
                  ),
                ),

                // Curved Nepali text using flutter_arc_text
                Positioned(
                  bottom: 80,
                  child: SizedBox(
                    width: 280,
                    height: 140,
                    child: ArcText(
                      radius: 120,
                      text: UiUtills.translate(context, 'rpp'), // e.g. "राष्ट्रिय प्रजातन्त्र पार्टी"
                      textStyle: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 4,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      startAngle: pi/2,
                      placement: Placement.inside,
                      direction: Direction.clockwise,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class HaloPainter extends CustomPainter {
  final double animationValue;

  HaloPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = min(size.width, size.height) / 2;
    final double glowRadius = radius + (10 * sin(animationValue * 2 * pi));

    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [Colors.yellowAccent.withOpacity(0.5), Colors.transparent],
      ).createShader(
        Rect.fromCircle(center: Offset(radius, radius), radius: glowRadius),
      );

    canvas.drawCircle(Offset(radius, radius), glowRadius, paint);
  }

  @override
  bool shouldRepaint(covariant HaloPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
