import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/flash_chat_controller.dart';

class FlashChatView extends GetView<FlashChatController> {
  const FlashChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FlashChatView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FlashChatView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
