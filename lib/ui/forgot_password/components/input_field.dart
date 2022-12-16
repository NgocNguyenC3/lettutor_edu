// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';

class InputFieldArea extends StatelessWidget {
  ForgotPasswordController controller;
  InputFieldArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalString.emailTitle,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: controller.emailController,
            hintText: '',
            validator: (value) {
              if (value == null) {
                return null;
              }

              if (!isEmail(value)) {
                return LocalString.emailRegisterRequired;
              }

              return null;
            },
            isOutline: true),
        SizedBox(
          height: 20.h,
        ),
        Obx(
          () => LoadingButtonWidget(
              submit: () {
                controller.forgotPassword();
              },
              isLoading: controller.loading.value,
              label: LocalString.confirm),
        )
      ],
    );
  }
}
