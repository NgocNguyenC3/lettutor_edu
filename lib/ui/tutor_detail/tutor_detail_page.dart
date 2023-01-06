// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/base_infor_tutor.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/booking_schedule_item.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_main_detail.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_video.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';
import 'package:lettutor_edu_clone/util/date_time.dart';
import 'package:intl/intl.dart';
import 'package:lettutor_edu_clone/widgets/common/button/base_button.dart';

class TutorDetailPage extends BasePage<TutorDetailController> {
  @override
  Widget buildContentView(BuildContext context) {
    return controller.isLoadingInit.value
        ? const Center(child: CircularProgressIndicator())
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseInforTutor(),
                SizedBox(
                  height: 20.h,
                ),
                TutorVideo(controller: controller),
                SizedBox(
                  height: 20.h,
                ),
                TutorMainDetail(controller: controller),
                SizedBox(
                  height: 20.h,
                ),
                Obx(
                  () => ButtonWidget(
                    text: DateFormat(time1).format(controller.time.value),
                    onTap: controller.selectDate,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Wrap(
                  runSpacing: 10,
                  children: [
                    ...controller.schedules.map(
                      (element) {
                        return BookingScheduleItem(
                          element: element,
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          );
  }
}
