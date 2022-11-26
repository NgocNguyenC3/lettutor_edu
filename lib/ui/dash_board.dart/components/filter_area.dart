import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';

import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/old_text_field.dart';


class FilterTutorArea extends StatelessWidget {
  const FilterTutorArea({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalString.dashBoardFindTutor,
          style:
              text28.copyWith(color: primaryColor, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 30.h,
        ),
        SizedBox(
          width: Get.width / 2 + 25.w,
          child: oldBaseTextField(
              radius: 20.r,
              onChanged: (value) {},
              controller: null,
              hintText: LocalString.dashBoardEnterTutorName),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: Get.width / 2 - 25.w,
          child: oldBaseTextField(
              radius: 20.r,
              onChanged: (value) {},
              controller: null,
              icon: const Icon(Icons.expand_more),
              hintText: LocalString.dashBoardSelectTutorNation),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          LocalString.dashBoardSelectAvailableTime,
          style: text16.copyWith(fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: Get.width / 2 - 15.w,
          child: oldBaseTextField(
              radius: 20.r,
              onChanged: (value) {},
              controller: null,
              icon: const Icon(Icons.calendar_today),
              hintText: LocalString.dashBoardSelectDay),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: Get.width / 4 * 3,
          child: oldBaseTextField(
              radius: 20.r,
              onChanged: (value) {},
              controller: null,
              icon: const Icon(Icons.schedule),
              hintText:
                  '${LocalString.dashBoardStartTime} -> ${LocalString.dashBoardEndTime}'),
        ),
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          spacing: 5.w,
          runSpacing: 10.h,
          children: [
            ...controller.listType
                .map((e) => TextContainer(
                      title: e,
                    ))
                .toList()
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        TextContainer(
          title: LocalString.dashBoardResetFilter,
          color: Colors.white,
          borderColor: primaryColor,
          textColor: primaryColor,
        )
      ],
    );
  }
}
