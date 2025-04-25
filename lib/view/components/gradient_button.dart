import 'package:flutter/material.dart';
import 'package:music_minds/src/screens.dart';

class GradientButton extends StatelessWidget {
  GradientButton({
    Key? key,
    this.callback,
    this.containerColor,
    this.borderSide,
    this.borderRadius,
    this.gradient,
    @required this.height,
    @required this.padding,
    this.text,
    @required this.textColor,
    @required this.width,
    this.fontSize,
  }) : super(key: key);
  final double? height;
  final double? width;
  final String? text;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsets? padding;
  final Gradient? gradient;
  final double? fontSize;
  final VoidCallback? callback;
  Border? borderSide;
  final Color? containerColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          color: containerColor,
          border: borderSide,
          gradient: gradient,
          borderRadius: BorderRadius.circular(
            borderRadius ?? 6.0,
          ),
        ),
        child: Center(
          child: Text(
            text ?? "",
            style: TextStyle(
              fontFamily: "Campton",
              color: textColor,
              fontWeight: FontWeight.w500,
              fontSize: fontSize ?? 12.spMin,
            ),
          ),
        ),
      ),
    );
  }
}

