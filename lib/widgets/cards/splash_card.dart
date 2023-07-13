import 'package:flutter/material.dart';

class SplashCard extends StatelessWidget {
  // Widget para ir antes de um card para mostrar um splash de "tap"
  const SplashCard({
    super.key,
    required this.child,
    this.borderRadius = 0,
    this.onTap,
    this.splashOpacity = 0.75,
    this.backgroundColor = Colors.transparent,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.splashColor,
    this.highlightColor,
  }) : super();

  final Widget child;
  final double borderRadius;
  final VoidCallback? onTap;
  final double splashOpacity;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? width;
  final double? height;
  final Color? splashColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: backgroundColor,
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          child,
          Positioned.fill(
            child: Opacity(
              opacity: splashOpacity,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(borderRadius),
                  splashColor: splashColor,
                  highlightColor: splashColor,
                  onTap: onTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}