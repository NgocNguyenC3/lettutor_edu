import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/course/course_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';


class HeaderCourse extends StatelessWidget {
  const HeaderCourse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleBox(
            size: 110.w, child: Assets.svg.course.iconCourse.svg(fit: BoxFit.cover)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              LocalString.courseTitle,
              style: text20.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),
            SizedBox(
              width: 200.w,
              child: baseTextField(
                  onChanged: (value) {},
                  controller: null,
                  hintText: 'Course',
                  icon: Icon(
                    Icons.search,
                    size: 15.w,
                  )),
            )
          ],
        )
      ],
    );
  }
}