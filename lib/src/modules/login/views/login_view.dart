import 'package:chat_app/src/components/buttons/custom_button.dart';
import 'package:chat_app/src/components/icons/flash_chat.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/field/custom_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView(this.isLogin, {Key? key}) : super(key: key);
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const AnimationLogo(size: 170),
              Column(
                children: [
                  CustomTextField(
                    controller: controller.email,
                    hintText: 'Enter your e-mail',
                    lableText: 'Email',
                  ),
                  const SizedBox(height: 15),
                  CustomTextField(
                    controller: controller.password,
                    lableText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ],
              ),
              CustomButton(
                text: isLogin ? 'Login' : 'Register',
                borderRadius: 30,
                onPressed: () async => await controller.loginRegister(isLogin),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
