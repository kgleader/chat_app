import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppDaiLog {
  static void showLoading() {
    Get.defaultDialog(content: const CupertinoActivityIndicator(radius: 20));
  }

  static Future<void> showAlert(String content, String? title) async {
    await Get.defaultDialog(
      title: title ?? 'Alert',
      content: Text(content, textAlign: TextAlign.center),
    );
  }

  static void showSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(message: message));
  }
}
