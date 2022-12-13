import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../routes/app_pages.dart';

class MyApp extends StatelessWidget {
  const MyApp(this.isAuth, {Key? key}) : super(key: key);

  final bool isAuth;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: isAuth ? AppPages.INITIALTRUE : AppPages.INITIALFALSE,
      getPages: AppPages.routes,
    );
  }
}
