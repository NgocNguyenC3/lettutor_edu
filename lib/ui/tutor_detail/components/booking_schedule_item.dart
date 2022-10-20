// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/base_infor_tutor.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_main_detail.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_video.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';

class BookingScheduleItem extends StatelessWidget {
  String date;
  String time;
  bool isDisable;
  BookingScheduleItem({
    Key? key,
    required this.date,
    required this.time,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BoxShadowContainer(
        width: Get.width,
        padding: EdgeInsets.all(10.r),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: text18.copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  time,
                  style: text15.copyWith(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              width: 100.w,
              height: 30.h,
              child: LoadingButtonWidget(
                  isDisable: isDisable,
                  submit: () {},
                  isLoading: false,
                  label: LocalString.book),
            )
          ],
        ));
  }
}
