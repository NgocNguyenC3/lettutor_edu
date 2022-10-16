// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/ui/base/base_scaffold.dart';
import 'package:lettutor_edu_clone/ui/login/components/input_field_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/login_title_area.dart';
import 'package:lettutor_edu_clone/ui/login/login_controller.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_icon_widget.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      resizeToAvoidBottomInset: true,
      actions: [
        CircleIconWidget(
          child: Assets.svg.common.iconVn.svg(),
        )
      ],
      body: SingleChildScrollView(
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
              padding:
                  EdgeInsets.only(left: 23.0.w, right: 23.0.w, bottom: 70.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LoginTitleArea(),
                  const InputFieldArea(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
