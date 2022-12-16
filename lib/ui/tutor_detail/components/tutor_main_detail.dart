// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/section_detail.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_with_link.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';

import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';

class TutorMainDetail extends StatelessWidget {
  final languages = Get.find<AppController>().languagesContry;

  TutorMainDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TutorDetailController controller;

  @override
  Widget build(BuildContext context) {
    final tutor = controller.tutor.value;
    final userModel = tutor.userModel;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTutorDetail(
          title: LocalString.languages,
          child: Wrap(
            spacing: 5.0.w,
            runSpacing: 5.0.w,
            children: [
              ...tutor.languages.split(',').map((e) => TextContainer(
                    title: languages[e] ?? e,
                    color: primaryColor.withOpacity(0.2),
                    textColor: primaryColor,
                  ))
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: LocalString.specialties,
          child: Wrap(
            spacing: 5.0.w,
            runSpacing: 5.0.w,
            children: [
              ...tutor.specialties.split(',').map(
                    (e) => TextContainer(
                      title: e,
                      color: primaryColor.withOpacity(0.2),
                      textColor: primaryColor,
                    ),
                  )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        if (userModel != null && userModel.courses.isNotEmpty)
          SectionTutorDetail(
            title: LocalString.tutorDetailSuggestedCourse,
            child: Wrap(
              spacing: 5.0.w,
              runSpacing: 5.0.w,
              children: [
                const SizedBox(),
                ...tutor.userModel!.courses.map(
                  (e) => TextWithLink(
                    title: e.name,
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: LocalString.interests,
          child: Text(
            tutor.interests,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: LocalString.tutorDetailEx,
          child: Text(
            tutor.experience,
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
