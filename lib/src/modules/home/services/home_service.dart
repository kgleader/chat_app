import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../data/message_model.dart';
import '../../../service/user_manager.dart';

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
      final Message message = Message(sender: sender!.email!, sms: sms, dateTime: DateTime.now());
      await db.collection('messages').add(message.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages() {
    final db = FirebaseFirestore.instance;
    return db.collection('messages').orderBy('dateTime', descending: true).snapshots();
  }
}
