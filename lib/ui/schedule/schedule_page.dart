// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/schedule/components/header_item.dart';
import 'package:lettutor_edu_clone/ui/schedule/components/schedule_item.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';
import 'package:lettutor_edu_clone/widgets/paging_widget.dart';

class SchedulePage extends BasePage<ScheduleController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderItem(
            img:
                Assets.svg.schedule.iconSchedule.svg(height: 80.w, width: 80.w),
            lowerContent: LocalString.scheduleTitle,
            upperContent: LocalString.schedule,
            lowerSubContent: LocalString.scheduleSubTitle,
          ),
          SizedBox(
            height: 20.h,
          ),
          if (controller.schedules.isEmpty)
            Center(
              child: Text(
                'Empty Data',
                style: text16,
              ),
            ),
          ...controller.schedules.map((element) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ScheduleItem(
                    schedule: element,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              )),
          SizedBox(
            height: 15.h,
          ),
          Obx(
            () => PagingWidget(
              currentNum: controller.currentNum.value,
              totalPage: controller.totalPage.value,
              pagingFunc: ((p0) {
                controller.getData(page: p0);
              }),
            ),
          ),
          SizedBox(
            height: 33.h,
          ),
        ],
      ),
    );
  }
}
