import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';

/// type: 0 success, else error
Future<void> notificationBar({
  required String message,
  bool isSuccess = true,
  int milliseconds = 2000,
  String? title,
}) async {
  Get.showSnackbar(GetSnackBar(
    title: title ?? LocalString.notification,
    message: message,
    duration: Duration(milliseconds: milliseconds),
    borderRadius: 20,
    margin: const EdgeInsets.only(left: 10, right: 10, bottom: 30),
    backgroundColor: isSuccess ? Colors.blue : Colors.red,
    icon: Icon(
      isSuccess ? Icons.done : Icons.close,
      color: Colors.white,
    ),
  ));
}
