import 'package:chat_app/src/utils/app_dialogs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

import '../service/home_service.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  final smsController = TextEditingController();

  Future<void> logout() async {
    AppDialog.showLoading();
    await HomeService.logout();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> delete() async {
    AppDialog.showLoading();
    await HomeService.delete();
    await Get.offAllNamed(Routes.FLASH_CHAT);
  }

  Future<void> sendMessage() async {
    final sms = smsController.text.trim();
    smsController.text = '';
    if (sms != '') {
      await HomeService.sendMessage(sms);
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages() {
    return HomeService.streamMessages();
  }
}
