import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';
import 'package:lettutor_edu_clone/ui/video_call/video_call.dart';

import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';

class HeaderDashboard extends StatelessWidget {
  final controller = Get.find<DashBoardController>();
  final List<Schedule> schedules;
  HeaderDashboard({
    Key? key,
    required this.schedules,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text = schedules.isEmpty
        ? 'Không có buổi học nào'
        : convertTime(schedules[0].scheduleDetailInfo?.scheduleInfo);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 15.0.h),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            LocalString.dashBoardUpComing,
            style: text28.copyWith(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: text18.copyWith(color: Colors.white),
          ),
          SizedBox(
            height: 15.h,
          ),
          Obx(
            () => Text(
              '${LocalString.dashBoardTotalTime} ${controller.totalTime.value ~/ 60} ${LocalString.hours} ${controller.totalTime.value % 60} ${LocalString.minutes}',
              textAlign: TextAlign.center,
              style: text18.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          if (schedules.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0.w),
              child: LoadingButtonWidget(
                  submit: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VideoCall(
                              studentMeetingLink:
                                  schedules[0].studentMeetingLink)),
                    );
                  },
                  isLoading: false,
                  height: 35.h,
                  textColor: primaryColor,
                  primaryColor: Colors.white,
                  label: LocalString.dashBoardEnterRoom),
            ),
        ],
      ),
    );
  }

  convertTime(Schedule? scheduleInfo) {
    if (scheduleInfo == null) {
      return 'Không có buổi học nào';
    }

    String text = '';
    text +=
        '${scheduleInfo.date} ${scheduleInfo.startTime} - ${scheduleInfo.endTime}';
    return text;
  }
}
