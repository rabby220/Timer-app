import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:timer/app/utils/app_color.dart';
import 'package:timer/app/utils/app_text.dart';

class HomeController extends GetxController {
  final CountDownController countDownController = CountDownController();

  RxBool isPlaying = false.obs;

  void toggleState() {
    if (timeController.text.isEmpty) {
      Get.snackbar(AppText.userInputText, AppText.userInputSubTitle,
          snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor);
    } else {
      isPlaying.toggle();

      if (isPlaying.value) {
        countDownController.resume();
        Get.snackbar(AppText.resumeText, AppText.resumeSubTitle,
            snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor);
      } else {
        countDownController.pause();
        Get.snackbar(AppText.pauseText, AppText.pauseSubTitle,
            snackPosition: SnackPosition.BOTTOM, colorText: AppColors.whiteColor);
      }
    }
  }

  final TextEditingController timeController = TextEditingController();
}
