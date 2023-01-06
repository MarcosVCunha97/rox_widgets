import 'package:flutter/material.dart';
import 'package:rox/theme/rox_colors.dart';
import 'package:rox/theme/rox_text_styles.dart';

class RoxDefaultErrorWidget extends StatelessWidget {
  const RoxDefaultErrorWidget({
    super.key,
    required this.title,
    required this.description,
    this.padding = const EdgeInsets.symmetric(horizontal: 32),
    this.mainAxisAlignment = MainAxisAlignment.center
  });

  final String title;
  final String description;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: padding,
        child: SizedBox(
          width: constraints.maxWidth != double.infinity ? constraints.maxWidth : null,
          height: constraints.maxHeight != double.infinity ? constraints.maxHeight : null,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: RoxTextStyles.to.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                description,
                style:
                    RoxTextStyles.to.bodyMedium.copyWith(color: RoxColors.to.neutral600, height: 1.5),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      );
    });
  }
}

