import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoxTextStyles {
  static String tag = 'roxTextStyles';

  RoxTextStyles({
    this.titleLarge = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 34,
      letterSpacing: 0.1,
      color: Color(0XFF212121),
    ),
    this.titleMedium = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 24,
      letterSpacing: 0.1,
      color: Color(0XFF212121),
    ),
    this.titleSmall = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 20,
      letterSpacing: 0.1,
      color: Color(0XFF212121),
    ),
    this.labelLarge = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 16,
      letterSpacing: 0.3,
      color: Color(0XFF212121),
    ),
    this.labelMedium = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.3,
      color: Color(0XFF212121),
    ),
    this.labelSmall = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.3,
      color: Color(0XFF212121),
    ),
    this.bodyLarge = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.25,
      color: Color(0XFF212121),
    ),
    this.bodyMedium = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.25,
      color: Color(0XFF212121),
    ),
    this.bodySmall = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.25,
      color: Color(0XFF212121),
    ),
    this.overline = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      fontSize: 10,
      letterSpacing: 0.5,
      color: Color(0XFF212121),
    ),
  });

  static RoxTextStyles get to => Get.find<RoxTextStyles>(tag: tag);

  final TextStyle titleLarge;
  final TextStyle titleMedium;
  final TextStyle titleSmall;
  final TextStyle labelLarge;
  final TextStyle labelMedium;
  final TextStyle labelSmall;
  final TextStyle bodyLarge;
  final TextStyle bodyMedium;
  final TextStyle bodySmall;
  final TextStyle overline;
}
