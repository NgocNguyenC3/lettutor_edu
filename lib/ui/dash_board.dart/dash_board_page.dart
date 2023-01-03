// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/filter_area.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/header_dash_board.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/information_tutor_container.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';
import 'package:lettutor_edu_clone/widgets/paging_widget.dart';

class DashBoardPage extends BasePage<DashBoardController> {
  @override
  Widget buildContentView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() => HeaderDashboard(schedules: controller.schedules.value)),
          SizedBox(
            height: 33.h,
          ),
          FilterTutorArea(controller: controller),
          SizedBox(
            height: 33.h,
          ),
          Text(
            LocalString.dashBoardRecommendTutor,
            style: text20.copyWith(fontWeight: FontWeight.w600),
          ),
          Obx(
            () => controller.loading.value
                ? const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    ),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      ...controller.listTuror.map((element) => Column(
                            children: [
                              InformationTutorContainer(
                                tutor: element,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ))
                    ],
                  ),
          ),
          SizedBox(
            height: 33.h,
          ),
          Obx(
            () => !controller.loading.value
                ? PagingWidget(
                    currentNum: controller.currentNum.value,
                    totalPage: controller.totalPage.value,
                    pagingFunc: ((p0) {
                      controller.getListbyPage(p0);
                    }),
                  )
                : const SizedBox(),
          ),
          SizedBox(
            height: 33.h,
          ),
        ],
      ),
    );
  }
}
