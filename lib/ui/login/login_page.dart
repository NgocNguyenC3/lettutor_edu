// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/ui/base/base_scaffold.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_icon_widget.dart';

import 'login_controller.dart';

class LoginPage extends GetWidget<LoginController> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
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
            Text(LocalString.loginTitle)
          ],
        ),
      ),
    );
  }
}
