
import 'package:flutter/material.dart';
import 'package:rox/theme/rox_text_styles.dart';
import 'package:rox/widgets/cards/splash_card.dart';

class RoxTextButton extends StatelessWidget {
  const RoxTextButton({
    super.key,
    required this.text,
    required this.onTap,
    this.borderRadius = 4,
    this.padding = const EdgeInsets.symmetric(vertical: 4.0, horizontal: 4.0),
    this.textStyle,
    this.splashColor,
    this.highlightColor,
  });
  
  final String text;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final Color? splashColor;
  final Color? highlightColor;
  final EdgeInsets padding;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return SplashCard(
      onTap: onTap,
      borderRadius: borderRadius,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: Padding(
        padding: padding,
        child: Text(text, style: textStyle ?? RoxTextStyles.to.bodyMedium),
      ),
    );
  }
}