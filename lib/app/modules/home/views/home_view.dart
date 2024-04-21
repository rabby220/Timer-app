import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:timer/app/utils/app_text.dart';
import '../../../utils/app_color.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0d0c1c),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///CircularCountDownTimer Library is Starting........
                CircularCountDownTimer(
                  backgroundColor: AppColors.circleBackgroundColor,
                  textStyle: AppText.circularCountDownTimer,
                  controller: controller.countDownController,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.height / 2,
                  duration: int.tryParse(controller.timeController.text) ?? 0,
                  strokeWidth: 15.0,
                  fillColor: AppColors.fillColor,
                  ringColor: AppColors.ringColor,
                ),

                /// Two Button is Working.............
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ///Start Button...............................
                    MaterialButton(
                      textColor: AppColors.blackColor ,
                      minWidth: 150.0,
                      height: 50.0,
                      color: AppColors.startButtonColor,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              shadowColor: AppColors.alertShadowColor,
                              titleTextStyle: AppText.titleAlertTextStyle,
                              title: const Text(
                                AppText.countText,
                              ),
                              content: TextFormField(
                                controller: controller.timeController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    hintText: AppText.hintText,
                                    hintStyle: AppText.hintsAlertTextStyle),
                              ),
                              actions: <Widget>[
                                MaterialButton(
                                  color: AppColors.actionButtonColor,
                                  onPressed: () {
                                    if (controller
                                        .timeController.text.isEmpty) {
                                      Get.snackbar('Enter Second', '',
                                          snackPosition: SnackPosition.BOTTOM,
                                          overlayBlur: 10.0);
                                    } else {
                                      int duration = int.tryParse(
                                              controller.timeController.text) ??
                                          0;
                                      controller.countDownController
                                          .restart(duration: duration);
                                      // controller.timeController.clear();
                                      Get.back();
                                    }
                                  },
                                  child: const Text(AppText.countText),
                                ),
                                MaterialButton(
                                  color: AppColors.actionButtonCancelColor,
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text(AppText.cancelText),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      clipBehavior: Clip.antiAlias,
                      splashColor: AppColors.splashColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Text(AppText.startText),
                    ),

                    /// Pause and Resume Button

                    MaterialButton(
                      textColor: AppColors.whiteColor,
                      minWidth: 150.0,
                      height: 50.0,
                      color: AppColors.actionButtonCancelColor,
                      onPressed: () {
                        controller.toggleState();
                      },
                      clipBehavior: Clip.antiAlias,
                      splashColor: AppColors.purpleAccentColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Obx(
                        () => Text(
                          controller.isPlaying.value
                              ? AppText.pauseText
                              : AppText.resumeText,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
