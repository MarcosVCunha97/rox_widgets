part of 'rox.dart';
// import 'package:get/get.dart';
// import 'package:rox/theme/rox_colors.dart';

class Initializer {
  static void init({RoxColors? colorTheme}){
    if(colorTheme != null){
      Get.put<RoxColors>(colorTheme, tag: 'colors');
    }
  }
}