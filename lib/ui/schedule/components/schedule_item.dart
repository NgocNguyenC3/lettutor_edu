import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/item_widget.dart';

class ScheduleItem extends StatelessWidget {
  final Schedule schedule;
  const ScheduleItem({
    Key? key,
    required this.schedule,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Schedule s = schedule.scheduleDetailInfo!.scheduleInfo!;
    return ItemWidget(
      nation: languages[s.tutorInfo!.user!.country]??'',
      avatar: CachedNetworkImage(
        imageUrl: s.tutorInfo!.user!.avatar,
        fit: BoxFit.cover,
      ),
      date: s.date,
      imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
      isDisableButton: false,
      name: s.tutorInfo!.user!.name,
      subTime: '',
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${s.startTime} - ${s.endTime}',
                  style: text16,
                ),
                SizedBox(
                  width: 80.w,
                  height: 30.h,
                  child: LoadingButtonWidget(
                      submit: () {},
                      isLoading: false,
                      primaryColor: Colors.red,
                      label: LocalString.cancel),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.expand_more,
                          size: 15.w,
                        ),
                        Text(
                          LocalString.scheduleRequest,
                          style: text14,
                        ),
                        Text(
                          LocalString.scheduleEditRequest,
                          style: text14.copyWith(color: primaryColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    padding: EdgeInsets.all(10.w),
                    width: double.infinity,
                    child: Text(
                      schedule.studentRequest.isEmpty
                          ? LocalString.scheduleRequestContent
                          : schedule.studentRequest,
                      style: text14.copyWith(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
