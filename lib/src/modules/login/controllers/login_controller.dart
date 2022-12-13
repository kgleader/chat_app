import 'package:chat_app/src/modules/login/services/login_service.dart';
import 'package:chat_app/src/service/user_manager.dart';
import 'package:chat_app/src/utils/app_dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final count = 0.obs;

  void increment() => count.value++;

  final email = TextEditingController();
  final password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  Future<void> loginRegister(bool isLogin) async {
    if (formKey.currentState!.validate() && GetUtils.isEmail(email.text) && GetUtils.isPassport(password.text)) {
      AppDialog.showLoading();
      final user = isLogin
          ? await LoginService.login(email.text, password.text)
          : await LoginService.register(email.text, password.text);
      Get.back();
      if (user != null) {
        await userManager.setUid(user.user!.uid);
        await Get.offAllNamed(Routes.HOME);
      } else {
        await AppDialog.showAlert(
          isLogin ? "Login je password kata" : "Kata boldu, suranych, kayradan araket kylynyz",
          'Error',
        );
      }
    } else {
      AppDialog.showSnackBar('Formany tuura tolturunuz');
    }
  }
}
