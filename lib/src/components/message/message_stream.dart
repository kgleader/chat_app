import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:chat_app/src/data/message_model.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream(
    this.streamMessages, {
    Key? key,
  }) : super(key: key);

  final Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
        stream: streamMessages,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final messages = (snapshot.data.docs.reversed as Iterable).map(
              (e) => Message.fromJson(e.data())..isMy = e.data()['sender'] == FirebaseAuth.instance.currentUser?.email,
            );
            return ListView(
              children: messages.map((e) => MessageWidget(e)).toList(),
            );
          } else {
            return const Center(child: CupertinoActivityIndicator());
          }
        },
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget(this.message, {Key? key}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        !message.isMy! ? 10 : width / 5,
        7,
        message.isMy! ? 10 : width / 5,
        7,
      ),
      child: Material(
        color: message.isMy! ? theme.primary : theme.onPrimaryContainer,
        borderOnForeground: false,
        clipBehavior: Clip.none,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(25),
            bottomRight: const Radius.circular(25),
            topLeft: !message.isMy! ? const Radius.circular(0) : const Radius.circular(25),
            topRight: message.isMy! ? const Radius.circular(0) : const Radius.circular(25),
          ),
        ),
        elevation: 8.0,
        shadowColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              !message.isMy!
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          message.sender,
                          style: TextStyle(
                            fontSize: 16,
                            color: theme.primary,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
              Text(
                message.sms,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.4,
                  color: message.isMy! ? Colors.white : null,
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('dd/MM/yy (hh:mm)').format(message.dateTime),
                    style: TextStyle(
                      fontSize: 12,
                      height: 1.4,
                      color: message.isMy! ? Colors.white : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
