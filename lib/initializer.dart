part of 'rox.dart';


class Initializer {
  static void init({AppColors? colorTheme}){
    if(colorTheme != null){
      Get.put<AppColors>(colorTheme, tag: AppColors.tag);
    }else{
      Get.put<AppColors>(appColorsInstance, tag: AppColors.tag);
    }
  }
}