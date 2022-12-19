import 'package:flutter/material.dart';

class SendMessage extends StatelessWidget {
  const SendMessage(
    this.textController,
    this.onPressed, {
    Key? key,
  }) : super(key: key);

  final TextEditingController textController;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.red, width: 2),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              controller: textController,
              maxLines: 5,
              minLines: 1,
              decoration: const InputDecoration(
                hintText: 'Type your message here',
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
            ),
          ),
          IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
