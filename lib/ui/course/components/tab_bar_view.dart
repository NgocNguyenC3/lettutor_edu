// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/course/course_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/course_item.dart';
import 'package:lettutor_edu_clone/widgets/common/tab_bar/tab_bar_item.dart';

class TabBarview extends StatelessWidget {
  CourseController controller;
  TabBarview({
    Key? key,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx((() => Row(
              children: [
                TabBarItem(
                  onTap: () {
                    controller.onTapInDexTabBar(0);
                  },
                  title: LocalString.course,
                  isSelecting: 0 == controller.index.value,
                ),
                SizedBox(width: 20.w),
                TabBarItem(
                  onTap: () {
                    controller.onTapInDexTabBar(1);
                  },
                  title: LocalString.eBook,
                  isSelecting: 1 == controller.index.value,
                ),
                SizedBox(width: 20.w),
                TabBarItem(
                  onTap: () {
                    controller.onTapInDexTabBar(2);
                  },
                  title: LocalString.ieBook,
                  isSelecting: 2 == controller.index.value,
                ),
              ],
            ))),
        SizedBox(
          height: 20.h,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'EngLish For Traveling',
              style: text26,
            ),
            SizedBox(
              height: 10.h,
            ),
            BoxShadowContainer(
              width: 280.w,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: 'Life in the Internet Age',
                subTitle:
                    'Lets discuss how technology is changing the way we live',
                bottomTitle: 'Intermediate 9 lessons',
                image: Assets.images.imgCourse1.image(fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            BoxShadowContainer(
              width: 280.w,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: 'Life in the Internet Age',
                subTitle:
                    'Lets discuss how technology is changing the way we live',
                bottomTitle: 'Intermediate 9 lessons',
                image: Assets.images.imgCourse2.image(fit: BoxFit.cover),
              ),
            ),
          ],
        )
      ],
    );
  }
}
