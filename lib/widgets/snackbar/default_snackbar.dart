import 'package:flutter/material.dart';
import 'package:rox/theme/rox_text_styles.dart';

class DefaultSnackBar extends StatelessWidget {
  final String message;
  final Widget icon;

  const DefaultSnackBar({
    super.key,
    required this.message, 
    required this.icon,
  });
  
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 15.0,
            offset: const Offset(-4.0, 8.0),
          ),
        ],
      ),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  message,
                  style: RoxTextStyles.to.bodyMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
