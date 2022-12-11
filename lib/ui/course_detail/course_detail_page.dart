// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/data/models/course.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/course_detail/components/overview_title.dart';
import 'package:lettutor_edu_clone/ui/course_detail/course_detail_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/course_item.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

class CourseDetailPage extends BasePage<CourseDetailController> {
  @override
  Widget buildContentView(BuildContext context) {
    Course course = controller.course;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: BoxShadowContainer(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20.h),
              child: CourseItem(
                mainTitle: course.name,
                subTitle: course.description,
                bottomWidget: LoadingButtonWidget(
                    submit: () {},
                    isLoading: false,
                    label: LocalString.courseDetailDiscover),
                image: CachedNetworkImage(
                    imageUrl: course.imageUrl, fit: BoxFit.cover),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          SectionCourseDetail(
            title: LocalString.overview,
            children: [
              OverViewTitle(
                title: LocalString.reason,
                content: course.reason,
              ),
              SizedBox(
                height: 10.h,
              ),
              OverViewTitle(
                  title: LocalString.purpose, content: course.purpose),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailExlv,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.group_add,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    'Intermediate',
                    style: text15.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailCourseLen,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.book,
                    color: primaryColor,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    '${course.topics.length} Topics',
                    style: text15.copyWith(fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
          SectionCourseDetail(
            title: LocalString.courseDetailCourseLen,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                child: Wrap(
                  spacing: 6.w,
                  runSpacing: 5.w,
                  children: [
                    ...course.topics.map((e) => BoxShadowContainer(
                          borderRadius: BorderRadius.circular(3.r),
                          width: Get.width,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.h,
                              ),
                              Text(
                                course.topics.indexOf(e).toString(),
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: primaryColor),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Text(
                                e.name,
                                style: text14.copyWith(
                                    fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

class SectionCourseDetail extends StatelessWidget {
  String title;
  List<Widget> children;
  SectionCourseDetail({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: text20.copyWith(fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.h,
        ),
        ...children
      ],
    );
  }
}
