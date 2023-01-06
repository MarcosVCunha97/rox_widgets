part of 'rox.dart';


class Initializer {
  static void init({RoxColors? colorTheme, RoxTextStyles? textTheme}){
    if(colorTheme != null){
      Get.put<RoxColors>(colorTheme, tag: RoxColors.tag);
    }else{
      Get.put<RoxColors>(appColorsInstance, tag: RoxColors.tag);
    }
    if(textTheme != null){
      Get.put<RoxTextStyles>(textTheme, tag: RoxTextStyles.tag);
    }else{
      Get.put<RoxTextStyles>(RoxTextStyles(), tag: RoxTextStyles.tag);
    }
  }
}