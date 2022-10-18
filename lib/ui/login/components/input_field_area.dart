// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/login/login_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';

class InputFieldArea extends StatelessWidget {
  late LoginController loginController;
  InputFieldArea({
    Key? key,
    required this.loginController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
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
            controller: null,
            hintText: 'email@example.com'),
        SizedBox(
          height: 15.h,
        ),
        Text(
          LocalString.passwordTitle,
          style: text14.copyWith(color: greyColor),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 8.h,
        ),
        baseTextField(
            onChanged: (value) {},
            controller: null,
            hintText: '',
            icon: InkWell(
              onTap: () {},
              child: const Icon(Icons.visibility, size: 20),
            )),
        SizedBox(
          height: 10.h,
        ),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.FORGOT_PASSWORD);
          },
          child: Text(
            LocalString.forgetPassword,
            style:
                text14.copyWith(color: const Color.fromRGBO(40, 106, 210, 1)),
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        Obx(
          () => LoadingButtonWidget(
              submit: () {
                Get.offNamed(AppRoutes.PROFILE);
              },
              isLoading: false,
              label: loginController.isLogin.value
                  ? LocalString.login
                  : LocalString.signUp),
        )
      ],
    );
  }
}
