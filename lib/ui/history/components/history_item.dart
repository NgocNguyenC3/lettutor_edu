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
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';
import 'package:lettutor_edu_clone/widgets/common/box_shadow_container.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/information_area.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';
import 'package:lettutor_edu_clone/widgets/input_field_profile.dart';
import 'package:lettutor_edu_clone/widgets/item_widget.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemWidget(
        avatar: Assets.images.img.image(fit: BoxFit.cover),
        date: 'Thu, 20 Oct 22',
        imgNation: Assets.svg.common.iconUs.svg(height: 22.w, width: 22.w),
        isDisableButton: false,
        name: 'Keegan',
        subTime: '1 hour ago',
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocalString.historyLessonTime,
                    style: text18,
                  ),
                  SizedBox(
                    width: 100.w,
                    child: LoadingButtonWidget(
                        height: 25.w,
                        submit: () {},
                        isLoading: false,
                        label: LocalString.record),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                LocalString.historyNoRquest,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              width: Get.width - 40.w,
              padding: EdgeInsets.all(10.w),
              color: Colors.white,
              child: Text(
                LocalString.historyTutorHaventRv,
                style: text14.copyWith(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: Get.width - 40.w,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalString.addRating,
                      style: text14.copyWith(color: primaryColor),
                    ),
                    Text(
                      LocalString.report,
                      style: text14.copyWith(color: primaryColor),
                    ),
                  ],
                )),
          ],
        ));
  }
}
