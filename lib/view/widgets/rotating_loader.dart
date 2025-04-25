import 'package:music_minds/config/app_images.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class RotatingLoader extends StatefulWidget {
  const RotatingLoader({super.key});

  @override
  State<RotatingLoader> createState() => _RotatingLoaderState();
}

class _RotatingLoaderState extends State<RotatingLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: child,
        );
      },
      // child: ImageView.asset(
      //   AppImagesPngs.loader ,
      //   width: 154.w,
      //   height: 154.h,
      // ),
    );
  }
}