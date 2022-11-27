import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';

import 'package:lettutor_edu_clone/widgets/common/text_field/label_english_type.dart';

class WantToLearnWrap extends StatelessWidget {
  final topics =
      Get.find<AppController>().userModel.value?.getListWanttoLearn() ?? [];
  WantToLearnWrap({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0.r),
          border: Border.all(
            color: greyBorderColor,
          )),
      child: Wrap(spacing: 5.0.w, runSpacing: 5.0.w, children: [
        ...topics.map(
          (e) => LabelEnglishType(
            content: e.name,
          ),
        )
      ]),
    );
  }
}
