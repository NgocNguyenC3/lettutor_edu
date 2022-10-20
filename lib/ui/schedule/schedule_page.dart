// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/schedule/components/header_item.dart';
import 'package:lettutor_edu_clone/ui/schedule/components/schedule_item.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/information_area.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';

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
          const ScheduleItem(),
          SizedBox(
            height: 20.h,
          ),
          const ScheduleItem(),
          SizedBox(
            height: 50.h,
          )
        ],
      ),
    );
  }
}
