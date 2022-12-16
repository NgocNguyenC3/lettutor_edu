import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/schedule/components/header_item.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/information_area.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';
import 'package:lettutor_edu_clone/widgets/item_widget.dart';

class HistoryItem extends StatelessWidget {
  final Schedule schedule;
  const HistoryItem({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Schedule s = schedule.scheduleDetailInfo!.scheduleInfo!;
    return ItemWidget(
        nation: languages[s.tutorInfo!.user!.country] ?? '',
        avatar: CachedNetworkImage(
          imageUrl: s.tutorInfo!.user!.avatar,
          fit: BoxFit.cover,
        ),
        date: s.date,
        imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
        isDisableButton: false,
        name: s.tutorInfo!.user!.name,
        subTime: '',
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                children: [
                  Text(
                    '${LocalString.historyLessonTime} ${s.startTime} - ${s.endTime}',
                    style: text18,
                  ),
                  if (schedule.showRecordUrl)
                    SizedBox(
                      width: 100.w,
                      child: LoadingButtonWidget(
                          height: 25.w,
                          submit: () {},
                          isLoading: false,
                          label: LocalString.record),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                schedule.studentRequest.isEmpty
                    ? LocalString.historyNoRquest
                    : schedule.studentRequest,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                LocalString.historyTutorHaventRv,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: Get.width - 40.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalString.addRating,
                      style: text14.copyWith(color: primaryColor),
                    ),
                    Text(
                      LocalString.report,
                      style: text14.copyWith(color: primaryColor),
                    ),
                  ],
                )),
          ],
        ));
  }
}
