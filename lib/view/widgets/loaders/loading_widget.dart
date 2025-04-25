
import 'package:music_minds/view/widgets/rotating_loader.dart';
import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';
import 'package:music_minds/src/config.dart';



class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.isLoading = false, required this.child, this.showText=true, this.title});
  final bool isLoading;
  final Widget child;
  final bool? showText;
  final String? title;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Material(
      child: WillPopScope(
        onWillPop: () async => isLoading? false:true,
        child: Stack(
          children: [
            child,
            Positioned.fill(
              child: Visibility(
                                                                                                                                                                                                               visible: isLoading,
                child: ColoredBox(
                  color: AppColors.kBackgroundDark.withOpacity(0.85),
                  child:  Center(
                    child:  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Lottie.asset(
                        //   'assets/animation/debbo_loader.json',
                        //   width: 154.w,
                        //   height: 154.h,
                        //   fit: BoxFit.fill,
                        // ),
                        const RotatingLoader(),
                        SizedBox(
                          height: 12.h,
                        ),
                        showText == true
                            ? TextView(
                          text:  title ?? TTexts.holdMomentText,
                          fontWeight: FontWeight.w600,
                          fontSize: 18.spMin,
                          color: Colors.white,
                        )
                            : Container()
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class AnimatedHeartbeat extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const AnimatedHeartbeat({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
  }) : super(key: key);

  @override
  _AnimatedHeartbeatState createState() => _AnimatedHeartbeatState();
}

class _AnimatedHeartbeatState extends State<AnimatedHeartbeat> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat();

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: widget.child,
    );
  }
}


