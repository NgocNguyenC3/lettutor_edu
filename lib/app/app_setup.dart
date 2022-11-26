import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_storage.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';

setupApp() async {
  // Set up service
  Get.put(UserService());
}

setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
}
