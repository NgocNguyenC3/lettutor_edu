import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';

class ProfileController extends BaseController {
  final _appController = Get.find<AppController>();
  final _userService = Get.find<UserService>();
  final Rx<UserModel> user = UserModel(birthday: DateTime(1990)).obs;
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [
      nameField,
      emailField,
      countryField,
      phoneField,
      birthayDayField,
      levelField,
      //wantToLearnField
      studyScheduleField,
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
    getUserInfo();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() {
    final _user = user.value;
    controllers[nameField]?.text = _user.name;
    controllers[emailField]?.text = _user.email;
    controllers[countryField]?.text =
        _appController.languagesContry[_user.country] ?? _user.country;
    controllers[phoneField]?.text = _user.phone;
    controllers[birthayDayField]?.text =
        DateFormat(time1).format(_user.birthday);
    controllers[levelField]?.text = _user.level;
    controllers[studyScheduleField]?.text = _user.studySchedule;
  }

  void chooseImage() async {
    try {
      final ImagePicker _picker = ImagePicker();
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        await _userService.uploadImage(File(pickedFile.path));
        user.value = _appController.userModel.value!;
      }
    } catch (e) {
      print(e);
    }
  }

  void getUserInfo() async {
    try {
      _userService.getUserInfo();
      user.value = _appController.userModel.value!;
    } catch (e) {}
    setUpDataProfile();
  }

  selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      initialDate: user.value.birthday,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: primaryColor,
            colorScheme: const ColorScheme.light(primary: primaryColor),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      firstDate: DateTime(1900),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      controllers[birthayDayField]?.text = DateFormat(time1).format(picked);
    }
  }
}
