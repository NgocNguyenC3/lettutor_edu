// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class ChangePasswordPage extends BasePage<ChangePasswordController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Text(LocalString.drawerChangePassword,
              style: text16.copyWith(fontWeight: FontWeight.w700)),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.passwordTitle,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.changePasswordNew,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          InputFieldProfile(
            isImportant: true,
            title: LocalString.changePasswordConfirm,
            child: baseTextField(
                onChanged: (value) {}, controller: null, hintText: ''),
          ),
          SizedBox(
            height: 25.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: SizedBox(
              width: Get.width / 2 - 50.w,
              child: LoadingButtonWidget(
                  height: 35.h,
                  submit: () {},
                  isLoading: false,
                  label: LocalString.confirm),
            ),
          )
        ],
      ),
    );
  }
}
