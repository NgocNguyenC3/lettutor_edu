// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';

import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';

class BookingScheduleItem extends StatelessWidget {
  String date = '';
  String time = '';
  bool isDisable = false;
  bool isBooked = false;

  final Schedule element;

  final controller = Get.find<TutorDetailController>();

  BookingScheduleItem({
    Key? key,
    required this.element,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isDisable = isBeforeNow(element.startTimestamp);
    date = readTimestamp(element.startTimestamp);
    time = '${element.startTime} - ${element.endTime}';
    isBooked = element.isBooked;

    return BoxShadowContainer(
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
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
                  submit: () {
                    if (!isBooked && !isDisable) controller.book(element.id);
                  },
                  isLoading: false,
                  primaryColor: isBooked ? Colors.green : null,
                  label: isBooked ? LocalString.booked : LocalString.book),
            )
          ],
        ));
  }
}
