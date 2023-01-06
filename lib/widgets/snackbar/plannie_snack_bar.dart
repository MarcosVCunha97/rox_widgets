import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rox/theme/rox_colors.dart';
import 'package:rox/widgets/snackbar/default_snackbar.dart';


class RoxSnackBar {

  static void showSuccessSnackbar(String message){
    _showSnackBar(message: message, icon: Icon(Icons.check_circle_outline, color: RoxColors.to.success500,));
  }

  static void showErrorSnackbar(String message){
    _showSnackBar(message: message, icon: Icon(Icons.error_outline, color: RoxColors.to.error700,));
  }

  static void showWarningSnackbar(String message){
    _showSnackBar(message: message, icon: Icon(Icons.warning_amber_outlined, color: RoxColors.to.warning400, size: 26,));
  }

  static void showInfoSnackbar(String message){
    _showSnackBar(message: message, icon: Icon(Icons.info_outline, color: RoxColors.to.warning400,));
  }

  static void _showSnackBar({required String message, required Widget icon}){
    Get.showSnackbar(
      GetSnackBar(
        duration: const Duration(seconds: 2),
        messageText: DefaultSnackBar(
          message: message, 
          icon: icon,
        ),
        backgroundColor: Colors.transparent,
        snackPosition: SnackPosition.TOP,
      )
    );
  }
}