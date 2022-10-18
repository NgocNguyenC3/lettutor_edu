import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/profile/components/logo_profile.dart';


class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Center(
          child: LogoProfile(),
        ),
        Text(
          'Long Long',
          style: text24.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.0.h,
        ),
        Text(
          '${LocalString.profileAccountID} f569c202-7bbf-4620-af77-ecc1419a6b28',
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

