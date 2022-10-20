// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/base_infor_tutor.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/booking_schedule_item.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_main_detail.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/components/tutor_video.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';

class TutorDetailPage extends BasePage<TutorDetailController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseInforTutor(),
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
          BookingScheduleItem(
            date: '20/10 Thu',
            time: '00:00 - 00:25',
          ),
          SizedBox(
            height: 10.h,
          ),
          BookingScheduleItem(
            date: '21/10 Fri',
            time: '00:00 - 00:25',
          ),
          SizedBox(
            height: 50.h,
          ),
        ],
      ),
    );
  }
}
