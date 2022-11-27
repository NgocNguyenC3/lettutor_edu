import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/util/validator.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';
import 'package:validators/validators.dart';

class ForgotPasswordController extends BaseController {
  final _userService = Get.find<UserService>();

  final TextEditingController emailController = TextEditingController();

  final RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
  }

  @override
  void onReloadData() {}

  Future<void> forgotPassword() async {
    validatorEmpty([emailController]);
    if (!isEmail(emailController.text)) {
      return;
    }
    loading.value = true;
    try {
      final response =
          await _userService.forgotPassword(email: emailController.text);
      notificationBar(message: response.message, isSuccess: true);
    } on DioError catch (e) {
      notificationBar(message: e.response?.data['message'], isSuccess: false);
    }
    loading.value = false;
  }
}
