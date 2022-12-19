import 'package:chat_app/src/service/user_manager.dart';
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

  Future<dynamic> sendMessage() async {}
}
