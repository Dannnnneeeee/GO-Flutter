import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool islandscopeOrientation(BuildContext context) {
    final ViewInsets = View.of(context).viewInsets;
    return ViewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final ViewInsets = View.of(context).viewInsets;
    return ViewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
        enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge);
  }

  // static double getScreenHeight() {
  //   return MediaQuery.of(Get.context!).size.height;
  // }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

}
