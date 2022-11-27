import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';

class ProfileController extends BaseController {
  final _appController = Get.find<AppController>();
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
  UserModel? get user => _appController.userModel.value;

  @override
  void onInit() {
    super.onInit();

    setUpDataProfile();
  }

  @override
  void onReloadData() {}

  void setUpDataProfile() {
    final _user = user ?? UserModel(birthday: DateTime(1990));
    controllers[nameField]?.text = _user.name;
    controllers[emailField]?.text = _user.email;
    controllers[countryField]?.text = _user.country;
    controllers[phoneField]?.text = _user.phone;
    controllers[birthayDayField]?.text =
        DateFormat(time1).format(_user.birthday);
    controllers[levelField]?.text = _user.level;
    controllers[studyScheduleField]?.text = _user.studySchedule;
  }
}
