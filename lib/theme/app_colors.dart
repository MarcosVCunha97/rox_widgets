import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rox/theme/rox_colors.dart';

class RoxAppColors {
  static String tag = 'roxPackageColors';

  RoxAppColors({
    required this.neutral900,
    required this.neutral800,
    required this.neutral700,
    required this.neutral600,
    required this.neutral500,
    required this.neutral400,
    required this.neutral300,
    required this.neutral200,
    required this.neutral100,
    required this.neutral50,
    required this.success900,
    required this.success700,
    required this.success500,
    required this.success400,
    required this.success300,
    required this.success200,
    required this.success100,
    required this.success50,
    required this.warning900,
    required this.warning700,
    required this.warning500,
    required this.warning400,
    required this.warning300,
    required this.warning200,
    required this.warning100,
    required this.warning50,
    required this.error900,
    required this.error700,
    required this.error500,
    required this.error400,
    required this.error300,
    required this.error200,
    required this.error100,
    required this.error50,
  });

  static RoxAppColors get to => Get.find(tag: RoxAppColors.tag);

  final Color neutral900;
  final Color neutral800;
  final Color neutral700;
  final Color neutral600;
  final Color neutral500;
  final Color neutral400;
  final Color neutral300;
  final Color neutral200;
  final Color neutral100;
  final Color neutral50;
  final Color success900;
  final Color success700;
  final Color success500;
  final Color success400;
  final Color success300;
  final Color success200;
  final Color success100;
  final Color success50;
  final Color warning900;
  final Color warning700;
  final Color warning500;
  final Color warning400;
  final Color warning300;
  final Color warning200;
  final Color warning100;
  final Color warning50;
  final Color error900;
  final Color error700;
  final Color error500;
  final Color error400;
  final Color error300;
  final Color error200;
  final Color error100;
  final Color error50;
}
