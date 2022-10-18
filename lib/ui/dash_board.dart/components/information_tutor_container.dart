import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/gen/colors.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/filter_area.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/components/header_dash_board.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';
import 'package:lettutor_edu_clone/ui/login/components/input_field_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/login_title_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/sign_up_area.dart';
import 'package:lettutor_edu_clone/ui/profile/components/logo_profile.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text/text_container.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_icon_widget.dart';

class InformationTutorContainer extends StatelessWidget {
  const InformationTutorContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final DashBoardController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            padding: EdgeInsets.all(30.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(width: 2.0.r, color: ColorName.greyColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleBox(
                    size: 80.w,
                    child: Assets.images.img.image(fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'Joan Gacer',
                  style: text20.copyWith(fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    Assets.svg.common.iconUs.svg(height: 15.w, width: 25.w),
                    SizedBox(width: 15.w),
                    Text(
                      'Taiwan',
                      style: text16,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  LocalString.dashBoardNoReview,
                  style: text16.copyWith(color: Colors.grey),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Wrap(
                  spacing: 5.w,
                  runSpacing: 10.h,
                  children: [
                    ...controller.listType
                        .map((e) => TextContainer(
                              title: e,
                              textColor: primaryColor,
                              color: primaryColor.withOpacity(0.2),
                            ))
                        .toList()
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: Get.width / 2 - 30.w,
                    child: LoadingButtonWidget(
                        submit: () {},
                        height: 30.h,
                        isLoading: false,
                        primaryColor: primaryColor.withOpacity(0.5),
                        label: LocalString.book),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
              ],
            )),
        Positioned(
            right: 30.w,
            top: 30.h,
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 25,
            ))
      ],
    );
  }
}
