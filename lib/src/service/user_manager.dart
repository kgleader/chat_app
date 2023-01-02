import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  late final SharedPreferences pref;

  static const uidKey = 'uid-key';

  Future<bool> init() async {
    pref = await SharedPreferences.getInstance();
    final uid = pref.getString(uidKey);
    return uid != null;
    // if (uid != null) {
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<void> setUid(String uid) async {
    await pref.setString(uidKey, uid);
  }

  Future<void> removeUid() async {
    await pref.remove(uidKey);
  }
}

final userManager = UserManager();
