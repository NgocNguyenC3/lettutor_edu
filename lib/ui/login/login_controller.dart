import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_storage.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';

class LoginController extends BaseController {
  Rx<bool> isLogin = true.obs;
  final _locale = Get.find<LocalizationService>();

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }
  @override
  void onReloadData() {
    
  }

  void changeLogin() {
    isLogin.value = !isLogin.value;
  }

}
