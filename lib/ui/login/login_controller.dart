import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/languages/localization_service.dart';
import 'package:lettutor_edu_clone/util/validator.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';

class LoginController extends BaseController {
  final _userService = Get.find<UserService>();

  final Rx<bool> isLogin = true.obs;
  final RxBool isHide = true.obs;

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

  final Map<String, bool> mapCheckInformation = {
    emailField: false,
    passwordField: false,
  };

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
    //
    validatorEmpty(controllers.values.toList());
    if (!checkRegisterAvailable(mapCheckInformation)) {
      return;
    }

    try {
      await _userService.logAccount(
          email: controllers[emailField]!.text,
          password: controllers[passwordField]!.text,
          isLogin: isLogin.value);
    } on DioError catch (e) {
      notificationBar(message: e.response?.data['message'], isSuccess: false);
      return;
    }
    Get.offNamed(AppRoutes.DASHBOARD);
  }

  String? Function(String?) validator(
      {required String? Function(dynamic value) func, required String key}) {
    return (value) {
      String? result = func(value);
      mapCheckInformation[key] = result != null ? false : true;
      return result;
    };
  }

  void changeHide() {
    isHide.value = !isHide.value;
  }
}
