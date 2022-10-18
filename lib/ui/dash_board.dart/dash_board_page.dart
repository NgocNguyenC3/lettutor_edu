// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/filter_area.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/header_dash_board.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/information_tutor_container.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';

class DashBoardPage extends BasePage<DashBoardController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderDashboard(),
          SizedBox(
            height: 33.h,
          ),
          FilterTutorArea(controller: controller),
          SizedBox(
            height: 33.h,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalString.dashBoardRecommendTutor,
                style: text20.copyWith(fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                controller: controller,
                countRating: 0,
              ),
              SizedBox(
                height: 15.h,
              ),
              InformationTutorContainer(
                controller: controller,
                countRating: 4,
              )
            ],
          ),
          SizedBox(
            height: 33.h,
          ),
        ],
      ),
    );
  }
}
