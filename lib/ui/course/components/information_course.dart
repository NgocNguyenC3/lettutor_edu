// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/course/components/header_course.dart';
import 'package:lettutor_edu_clone/ui/course/course_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/text_field_drop_down.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class InformationCourse extends StatelessWidget {
  const InformationCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderCourse(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          LocalString.courseContent,
          style: text15,
        ),
        SizedBox(
          height: 14.h,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              children: [
                SizedBox(
                  width: Get.width / 2 - 25.w,
                  child: baseTextField(
                      onChanged: (value) {},
                      controller: null,
                      hintText: LocalString.courseLevel,
                      icon: const Icon(Icons.expand_more)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: Get.width / 2 - 25.w,
                  child: baseTextField(
                      onChanged: (value) {},
                      controller: null,
                      hintText: LocalString.courseSortlv,
                      icon: const Icon(Icons.expand_more)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: Get.width / 2 - 25.w,
              child: baseTextField(
                  onChanged: (value) {},
                  controller: null,
                  hintText: LocalString.courseCategory,
                  icon: const Icon(Icons.expand_more)),
            ),
          ],
        )
      ],
    );
  }
}