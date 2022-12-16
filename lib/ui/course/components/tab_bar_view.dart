// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/data/models/course.dart';

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
        Obx(() => (!controller.isLoadingCourse.value)
            ? Column(
                children: [
                  if (controller.courseMap.isNotEmpty)
                    ...controller.courseMap.entries
                        .map((e) => buildCourse(e.key, e.value))
                        .toList(),
                  if (controller.courseMap.isEmpty)
                    const Center(
                      child: Icon(
                        Icons.deselect,
                        size: 100,
                      ),
                    )
                ],
              )
            : const SizedBox())
      ],
    );
  }

  Column buildCourse(String title, List<Course> courses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: text26.copyWith(color: primaryColor),
        ),
        SizedBox(
          height: 20.h,
        ),
        ...courses.map((e) => Column(
              children: [
                BoxShadowContainer(
                  onTap: () {
                    Get.toNamed(AppRoutes.COURSE_DETAIL, arguments: [e]);
                  },
                  width: 280.w,
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: CourseItem(
                    mainTitle: e.name,
                    subTitle: e.description,
                    bottomWidget: Text(
                      e.topics.isEmpty
                          ? 'Intermediate'
                          : 'Intermediate ${e.topics.length} lessons',
                      style: text14,
                    ),
                    image: CachedNetworkImage(
                        imageUrl: e.imageUrl, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
              ],
            )),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
