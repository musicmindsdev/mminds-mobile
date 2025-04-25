import 'package:flutter/material.dart';
import 'package:music_minds/src/components.dart';

class GradientOutlineButton extends StatelessWidget {
  final GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Color? color;
  final double? width;
  final EdgeInsets? margin;
  final double? height;
  GradientOutlineButton(
      {@required double? strokeWidth,
      @required double? radius,
      @required Gradient? gradient,
      @required Widget? child,
      @required VoidCallback? onPressed,
      this.height,
      this.color,
      this.width,
      this.margin})
      : this._painter =
            GradientPainter(strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child!,
        this._callback = onPressed!,
        this._radius = radius!;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            margin: margin,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(_radius)),
            constraints: BoxConstraints(
              minWidth: width ?? double.infinity,
              minHeight: height ?? 47.h,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GradientOutlineImageButton extends StatelessWidget {
  final GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  final Color? color;
  final double? width;
  GradientOutlineImageButton(
      {@required double? strokeWidth,
      @required double? radius,
      @required Gradient? gradient,
      @required Widget? child,
      @required VoidCallback? onPressed,
      this.color,
      this.width})
      : this._painter =
            GradientPainter(strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        this._child = child!,
        this._callback = onPressed!,
        this._radius = radius!;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: InkWell(
          borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(_radius)),
            constraints: BoxConstraints(
              minWidth: width ?? double.infinity,
              minHeight: 52.h,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
