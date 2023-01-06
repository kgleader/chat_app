import 'package:chat_app/src/service/user_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app/app.dart';
import 'firebase_options.dart';

// https://github.com/FlutterLearningOrg/Chat-app
// https://github1s.com/FlutterLearningOrg/Chat-app

bool shouldUseFirebaseEmulator = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (shouldUseFirebaseEmulator) {
    await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  }

  final isAuth = await userManager.init();

  runApp(MyApp(isAuth));
}
