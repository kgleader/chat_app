import 'package:chat_app/src/data/message_model.dart';
import 'package:chat_app/src/service/user_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  static Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await userManager.removeUid();
  }

  static Future<void> delete() async {
    await FirebaseAuth.instance.currentUser?.delete();
    await userManager.removeUid();
  }

  static Future<void> sendMessage(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender?.email != null) {
      final db = FirebaseFirestore.instance;
      final Message message = Message(sender!.email!, sms);
      await db.collection('messages').add(message.toJson());
    }
  }
}
