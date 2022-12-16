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
import 'package:lettutor_edu_clone/ui/course/components/information_course.dart';
import 'package:lettutor_edu_clone/ui/course/components/tab_bar_view.dart';
import 'package:lettutor_edu_clone/ui/course/course_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/text_field_drop_down.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class CoursePage extends BasePage<CourseController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 25.h,
          ),
          const InformationCourse(),
          SizedBox(
            height: 20.h,
          ),
          TabBarview(
            controller: controller,
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
