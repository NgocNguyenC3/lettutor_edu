// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/ui/base/base_page.dart';
import 'package:lettutor_edu_clone/ui/login/components/input_field_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/login_title_area.dart';
import 'package:lettutor_edu_clone/ui/login/components/sign_up_area.dart';
import 'package:lettutor_edu_clone/ui/login/login_controller.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 250.h,
      padding: EdgeInsets.only(top: 20.h),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            CircleBox(size: 25, child: Assets.images.img.image()),
            SizedBox(
              width: 15.w,
            ),
            Text(
              'Long Long',
              style: text18.copyWith(fontWeight: FontWeight.w600),
            ),
          ],
        ),
        listTitle(
            iconData: Icons.book,
            title: LocalString.drawerBuyLessons,
            named: ''),
        listTitle(
            iconData: Icons.key,
            title: LocalString.drawerChangePassword,
            named: ''),
        listTitle(
            iconData: Icons.contacts,
            title: LocalString.drawerTutor,
            named: ''),
        listTitle(
            iconData: Icons.event_available,
            title: LocalString.drawerSchedule,
            named: ''),
        listTitle(
            iconData: Icons.history,
            title: LocalString.drawerHistory,
            named: ''),
        listTitle(
            iconData: Icons.school,
            title: LocalString.drawerCourses,
            named: ''),
        listTitle(
            iconData: Icons.import_contacts,
            title: LocalString.drawerMyCourse,
            named: ''),
        listTitle(
            iconData: Icons.hail,
            title: LocalString.drawerBecomeAtutor,
            named: ''),
        listTitle(iconData: Icons.logout, title: LocalString.logout, named: ''),
      ]),
    );
  }

  Widget listTitle(
      {required IconData iconData,
      required String title,
      required String named}) {
    return InkWell(
      onTap: () {
        //Get.offNamed(named);
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: primaryColor,
            size: 25,
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            title,
            style: text18.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
