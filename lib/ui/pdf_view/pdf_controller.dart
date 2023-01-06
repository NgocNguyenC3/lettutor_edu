import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/util/validator.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';

class PdfController extends BaseController {
  String url = '';

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
    url = Get.arguments;
    print(Get.arguments);
  }

  @override
  void onReloadData() {
    // TODO: implement onReloadData
  }
}
