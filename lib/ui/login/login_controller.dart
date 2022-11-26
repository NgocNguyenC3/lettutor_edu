import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';

class LoginController extends BaseController {
  final _userService = Get.find<UserService>();

  final Rx<bool> isLogin = true.obs;
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      emailField,
      passwordField,
    ].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  @override
  void onReloadData() {}

  void changeLogin() {
    isLogin.value = !isLogin.value;
  }

  void onClickLogIn() async {
    try {
      final data = await _userService.login(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text);
    } on DioError catch (e) {
      print(e.response?.data['message']);
    }
    //Get.offNamed(AppRoutes.DASHBOARD);
  }
}
