import 'package:chat_app/src/service/user_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeService {
  static Future<dynamic> logout() async {
    await FirebaseAuth.instance.signOut();
    await userManager.removeUid();
  }

  static Future<dynamic> delete() async {
    await FirebaseAuth.instance.currentUser?.delete();
    await userManager.removeUid();
  }

  static sendMessage(String sms) {}

  static Stream<QuerySnapshot<Map<String, dynamic>>> streamMessages() {}
}
