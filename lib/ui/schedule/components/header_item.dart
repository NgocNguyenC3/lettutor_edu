// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class HeaderItem extends StatelessWidget {
  Widget img;
  String upperContent;
  String lowerContent;
  String lowerSubContent;
  HeaderItem({
    Key? key,
    required this.img,
    required this.upperContent,
    required this.lowerContent,
    required this.lowerSubContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        img,
        SizedBox(
          height: 5.h,
        ),
        Text(
          upperContent,
          style: text28.copyWith(fontWeight: FontWeight.w800),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            Container(
              width: 5.w,
              height: 120.h,
              color: Colors.grey.withOpacity(0.5),
            ),
            SizedBox(
              width: 3.w,
            ),
            SizedBox(
              width: Get.width - 50.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: Get.width - 50.w,
                    child: Text(
                      lowerContent,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    width: Get.width - 50.w,
                    child: Text(
                      lowerSubContent,
                      style: text16.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
