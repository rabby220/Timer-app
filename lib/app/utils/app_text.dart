import 'package:flutter/material.dart';

class AppText {
  static const hintsAlertTextStyle = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 15.0,
    color: Colors.black,
  );

  static const titleAlertTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 25.0,
    color: Colors.black,
  );

  static TextStyle circularCountDownTimer = const TextStyle(
    color: Colors.black,
    fontSize: 40.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'digit',
  );

  static const hintText = 'Enter Duration in seconds.';
  static const alertCountText = 'Count Down';

  static const userInputText = 'Input Required.';
  static const userInputSubTitle = 'Please enter a duration first.';

  static const resumeSubTitle = 'You clicked for resume';
  static const pauseSubTitle = 'You clicked for pause';

  static const pauseText = 'Pause';
  static const resumeText = 'Resume';
  static const startText = 'Start';
  static const cancelText = 'Cancel';
  static const countText = 'Count';
}
