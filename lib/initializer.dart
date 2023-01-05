part of 'rox.dart';


class Initializer {
  static void init({RoxAppColors? colorTheme}){
    if(colorTheme != null){
      Get.put<RoxAppColors>(colorTheme, tag: RoxAppColors.tag);
    }else{
      Get.put<RoxAppColors>(appColorsInstance, tag: RoxAppColors.tag);
    }
  }
}