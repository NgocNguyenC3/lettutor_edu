// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/components/input_field.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_controller.dart';

class ForgotPasswordPage extends BasePage<ForgotPasswordController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              LocalString.forgotPasswordTiTle,
              style: text28.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              LocalString.forgotPasswordSubTiTle,
              style: text14,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            const InputFieldArea()
          ],
        ),
      ),
    );
  }
}
