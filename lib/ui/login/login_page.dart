// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/login/components/input_field_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/login_title_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/sign_up_area.dart';
import 'package:lettutor_edu_clone/ui/login/login_controller.dart';

class LoginPage extends BasePage<LoginController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 35.h,
          ),
          Assets.images.imageLogin.image(),
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LoginTitleArea(),
                SizedBox(
                  height: 15.h,
                ),
                const InputFieldArea(),
                SizedBox(
                  height: 25.h,
                ),
                const SignUpArea()
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildActionView(BuildContext context) {
    return const SizedBox();
  }
}
