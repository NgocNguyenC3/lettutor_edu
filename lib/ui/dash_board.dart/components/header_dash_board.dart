import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';

import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';

class HeaderDashboard extends StatelessWidget {
  final controller = Get.find<DashBoardController>();
  HeaderDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              Text(
                'T4, 19 Thg 10 22 00:00 - 00:25',
                textAlign: TextAlign.center,
                style: text18.copyWith(color: Colors.white),
              ),
              Text(
                '(còn 06:51:34)',
                style: text16.copyWith(color: ColorName.yellowColor),
              ),
            ],
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: LoadingButtonWidget(
                submit: () {},
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
}
