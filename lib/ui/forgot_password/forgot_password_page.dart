// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_controller.dart';
import 'package:lettutor_edu_clone/ui/login/components/input_field_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/login_title_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/sign_up_area.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';

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
            ),
            SizedBox(
              height: 15.h,
            ),
            Column(
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
                    onChanged: (value) {}, controller: null, hintText: ''),
                SizedBox(
                  height: 20.h,
                ),
                LoadingButtonWidget(
                    submit: () {}, isLoading: false, label: LocalString.confirm)
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget buildActionView(BuildContext context) {
    return const SizedBox();
  }
}
