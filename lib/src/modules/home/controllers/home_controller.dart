import 'package:get/get.dart';

import 'package:chat_app/src/routes/app_pages.dart';

import '../../../utils/app_dialogs.dart';
import '../service/home_service.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

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
}
