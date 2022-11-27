import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';

import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';

import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/old_text_field.dart';
import 'package:lettutor_edu_clone/widgets/wrap_field.dart';

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
              focusNode: controller.focusNode,
              onChanged: (value) {},
              controller: controller.controllers[nameField],
              hintText: LocalString.dashBoardEnterTutorName),
        ),
        SizedBox(
          height: 10.h,
        ),
        Obx(
          () => WrapField(
            onTap: () {
              controller.onTapWrapField();
            },
            width: Get.width / 2 - 25.w,
            radius: 20.r,
            widgets: controller.nations.value,
            hintText: LocalString.dashBoardSelectTutorNation,
          ),
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
              controller: controller.controllers[dateField],
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
              controller: controller.controllers[dateStartField],
              icon: const Icon(Icons.schedule),
              hintText: LocalString.dashBoardStartTime),
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          width: Get.width / 4 * 2,
          child: oldBaseTextField(
              radius: 20.r,
              onChanged: (value) {},
              controller: controller.controllers[dateEndField],
              icon: const Icon(Icons.schedule),
              hintText: LocalString.dashBoardEndTime),
        ),
        SizedBox(
          height: 10.h,
        ),
        Obx(
          () {
            String data = controller.currentType.value;
            return Wrap(
              spacing: 5.w,
              runSpacing: 10.h,
              children: [
                ...controller.listType.map((e) {
                  return TextContainer(
                    title: e,
                    isSelect: e == data,
                    onTap: () {
                      controller.onTapType(e);
                    },
                  );
                }).toList()
              ],
            );
          },
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
