// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/section_detail.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_with_link.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';

import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';


class TutorMainDetail extends StatelessWidget {
  const TutorMainDetail({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final TutorDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTutorDetail(
          title: LocalString.languages,
          child: TextContainer(
            title: 'English',
            color: primaryColor.withOpacity(0.2),
            textColor: primaryColor,
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
              ...controller.listSpecial.map(
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
        SectionTutorDetail(
          title: LocalString.tutorDetailSuggestedCourse,
          child: Wrap(
            spacing: 5.0.w,
            runSpacing: 5.0.w,
            children: [
              const SizedBox(),
              ...controller.listSuggestCourse.map(
                (e) => TextWithLink(
                  title: e,
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
            'I loved the weather, the scenery and the laid-back lifestyle of the locals.',
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        SectionTutorDetail(
          title: LocalString.tutorDetailEx,
          child: Text(
            'I have more than 10 years of teaching english experience',
            style: text15.copyWith(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
