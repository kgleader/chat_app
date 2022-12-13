import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chat_app/src/constants/app_colors.dart';
import 'package:chat_app/src/constants/text_styles.dart';
import 'package:chat_app/src/modules/flash_chat/controllers/flash_chat_controller.dart';

import '../../../components/buttons/custom_button.dart';
import '../../../components/icons/flash_chat.dart';
import '../../../routes/app_pages.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AnimationLogo(),
              DefaultTextStyle(
                style: AppTextStyle.flashChat,
                child: AnimatedTextKit(
                  totalRepeatCount: 1000,
                  animatedTexts: [WavyAnimatedText('Flash Chat')],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Login',
            backgroundColor: AppColors.loginButton,
            onPressed: () async => await Get.toNamed(Routes.LOGIN, arguments: true),
          ),
          const SizedBox(height: 25),
          CustomButton(
            text: 'Register',
            backgroundColor: AppColors.registerButton,
            onPressed: () async => await Get.toNamed(Routes.LOGIN, arguments: false),
          ),
        ],
      ),
    );
  }
}
