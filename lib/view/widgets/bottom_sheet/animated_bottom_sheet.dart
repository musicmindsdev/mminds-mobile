import 'package:flutter/material.dart';

class AnimatedBottomSheet extends StatefulWidget {
  const AnimatedBottomSheet({super.key, required this.bottomSheetContent});

  final Widget bottomSheetContent;

  @override
  State<AnimatedBottomSheet> createState() => _AnimatedBottomSheetState();
}

class _AnimatedBottomSheetState extends State<AnimatedBottomSheet>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Defines the animation with a bounce curve
    _animation = Tween<double>(begin: 50, end: 0).animate(
        CurvedAnimation(parent: _controller, curve: Curves.elasticOut)
    );
    // Start the animation
    _controller.forward();
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
        return Transform.translate(
          offset: Offset(0, _animation.value), // Slide up and bounce effect
          child: child,
        );
      },
      // Bottom sheet content
      child: widget.bottomSheetContent,
    );
  }
}
