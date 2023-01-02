import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../service/user_manager.dart';
import '../../../utils/app_dialogs.dart';
import '../services/login_service.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> loginRegister(bool isLogin) async {
    if (formKey.currentState!.validate() && GetUtils.isEmail(email.text) && GetUtils.isPassport(password.text)) {
      AppDaiLog.showLoading();
      final user = isLogin
          ? await LoginService.login(email.text, password.text)
          : await LoginService.register(email.text, password.text);
      Get.back();
      if (user != null) {
        await userManager.setUid(user.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      } else {
        await AppDaiLog.showAlert(
          isLogin ? "Login je Password tuura emes" : "Kata boldu suranych kairadan araket vkylynyz",
          'Error',
        );
      }
    } else {
      AppDaiLog.showSnackBar('formany tuura tolturunuz');
    }
  }
}
