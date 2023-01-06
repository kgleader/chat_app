import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/message/message_stream.dart';
import '../../../components/message/send_message.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('⚡️Chat'),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Logout Account'),
                onTap: () async => await controller.logout(),
              ),
              PopupMenuItem(
                onTap: () async => await controller.delete(),
                child: const Text('Delete Account'),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          MessagesStream(controller.streamMessages()),
          SendMessage(
            controller.smsController,
            () async => controller.sendMessage(),
          ),
        ],
      ),
    );
  }
}
