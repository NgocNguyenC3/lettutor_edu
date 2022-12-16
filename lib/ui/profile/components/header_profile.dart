import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/profile/components/logo_profile.dart';

class HeaderProfile extends StatelessWidget {
  final user = Get.find<AppController>().userModel.value ?? defUser;
  HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: LogoProfile(
            userLink: user.avatar,
          ),
        ),
        Text(
          user.name,
          style: text24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          '${LocalString.profileAccountID} ${user.id}',
          style: text14.copyWith(color: greyColor),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        InkWell(
          onTap: () {},
          child: Text(
            LocalString.profileOtherReviews,
            style: text14.copyWith(color: primaryColor),
          ),
        ),
      ]),
    );
  }
}
