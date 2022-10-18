import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';

class ProfileController extends BaseController {
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

    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() {
    controllers[nameField]?.text = 'Long Long';
    controllers[emailField]?.text = 'student@lettutor.com';
    controllers[countryField]?.text = 'Viet Nam';
    controllers[phoneField]?.text = '842499996508';
    controllers[birthayDayField]?.text = '1999-06-10';
    controllers[levelField]?.text = 'Pre A1 (beginner)';
    //controllers[studyScheduleField]?.text = '';
  }
}