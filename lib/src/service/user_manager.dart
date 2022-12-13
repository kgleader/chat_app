import 'package:shared_preferences/shared_preferences.dart';

class UserManager {
  // eger user koldonchu  login je register bolso al userdin ID UID sin cache ke saktap kalsyn
  // eger UID bar bolso Home page ge jiber
  // eger no UID go to Flash App ka jiber
  // eger koldonuuchu login je register bolso al userdin UID sin cache ge sakta
  // eger koldonuuchu login je delete bolso UID ochurup sal

  late SharedPreferences pref;

  static const uidKey = 'uid-key';

  Future<bool> init() async {
    pref = await SharedPreferences.getInstance();
    final uid = pref.getString(uidKey);
    return uid != null;
  }

  Future<void> setUid(String uid) async {
    await pref.setString(uidKey, uid);
  }

  Future<void> removeUid() async {
    await pref.remove(uidKey);
  }
}

final userManager = UserManager();
