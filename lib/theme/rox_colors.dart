
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoxColors {

  static RoxColors get to {
    try {
      return Get.find(tag: 'colors');
    } catch (e) {
      return RoxColors();
    }
  }

  static const Color transparent = Colors.transparent;
  static const Color white = Color(0XFFFFFFFF);
  static const Color black = Color(0XFF000000);

  static const Color neutral900 = Colors.black;
  static const Color neutral800 = Colors.black;
  static const Color neutral700 = Colors.black;
  static const Color neutral600 = Colors.black;
  static const Color neutral500 = Colors.black;
  static const Color neutral400 = Colors.black;
  static const Color neutral300 = Colors.black;
  static const Color neutral200 = Colors.black;
  static const Color neutral100 = Colors.black;
  static const Color neutral50 = Colors.black;

  static const Color success900 = Colors.black;
  static const Color success700 = Colors.black;
  static const Color success500 = Colors.black;
  static const Color success400 = Colors.black;
  static const Color success300 = Colors.black;
  static const Color success200 = Colors.black;
  static const Color success100 = Colors.black;
  static const Color success50 = Colors.black;

  static const Color warning900 = Colors.black;
  static const Color warning700 = Colors.black;
  static const Color warning500 = Colors.black;
  static const Color warning400 = Colors.black;
  static const Color warning300 = Colors.black;
  static const Color warning200 = Colors.black;
  static const Color warning100 = Colors.black;
  static const Color warning50 = Colors.black;

  static const Color error900 = Colors.black;
  static const Color error700 = Colors.black;
  static const Color error500 = Colors.black;
  static const Color error400 = Colors.black;
  static const Color error300 = Colors.black;
  static const Color error200 = Colors.black;
  static const Color error100 = Colors.black;
  static const Color error50 = Colors.black;

  Color get neutral900g => neutral900;
  Color get neutral800g => neutral800;
  Color get neutral700g => neutral700;
  Color get neutral600g => neutral600;
  Color get neutral500g => neutral500;
  Color get neutral400g => neutral400;
  Color get neutral300g => neutral300;
  Color get neutral200g => neutral200;
  Color get neutral100g => neutral100;
  Color get neutral50g => neutral50;

  Color get success900g => success900;
  Color get success700g => success700;
  Color get success500g => success500;
  Color get success400g => success400;
  Color get success300g => success300;
  Color get success200g => success200;
  Color get success100g => success100;
  Color get success50g => success50;

  Color get warning900g => warning900;
  Color get warning700g => warning700;
  Color get warning500g => warning500;
  Color get warning400g => warning400;
  Color get warning300g => warning300;
  Color get warning200g => warning200;
  Color get warning100g => warning100;
  Color get warning50g => warning50;

  Color get error900g => error900;
  Color get error700g => error700;
  Color get error500g => error500;
  Color get error400g => error400;
  Color get error300g => error300;
  Color get error200g => error200;
  Color get error100g => error100;
  Color get error50g => error50;

}

