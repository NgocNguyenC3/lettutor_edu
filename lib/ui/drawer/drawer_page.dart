// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/gen/assets.gen.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/icon/circle_box.dart';

class DrawerPage extends StatelessWidget {
  final user = Get.find<AppController>().userModel.value;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 250.h,
      padding: EdgeInsets.only(top: 20.h),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            Get.offNamed(AppRoutes.PROFILE, preventDuplicates: false);
          },
          child: Row(
            children: [
              CircleBox(
                  size: 25,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: user?.avatar ?? imgLink,
                  )),
              SizedBox(
                width: 15.w,
              ),
              Text(
                user?.name ?? 'No Name',
                style: text18.copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        listTitle(
            iconData: Icons.book,
            title: LocalString.drawerBuyLessons,
            named: ''),
        listTitle(
            iconData: Icons.key,
            title: LocalString.drawerChangePassword,
            named: AppRoutes.CHANGE_PASSWORD),
        listTitle(
            iconData: Icons.contacts,
            title: LocalString.drawerTutor,
            named: AppRoutes.DASHBOARD),
        listTitle(
            iconData: Icons.event_available,
            title: LocalString.drawerSchedule,
            named: AppRoutes.SCHEDULE),
        listTitle(
            iconData: Icons.history,
            title: LocalString.drawerHistory,
            named: AppRoutes.HISTORY),
        listTitle(
            iconData: Icons.school,
            title: LocalString.drawerCourses,
            named: AppRoutes.COURSE),
        listTitle(
            iconData: Icons.import_contacts,
            title: LocalString.drawerMyCourse,
            named: ''),
        listTitle(
            iconData: Icons.hail,
            title: LocalString.drawerBecomeAtutor,
            named: ''),
        listTitle(
            iconData: Icons.logout,
            title: LocalString.logout,
            named: AppRoutes.LOGIN),
      ]),
    );
  }

  Widget listTitle(
      {required IconData iconData,
      required String title,
      required String named}) {
    return InkWell(
      onTap: () {
        if (named == AppRoutes.LOGIN) {
          Get.find<AppController>().logout();
        }
        if (named.isNotEmpty) {
          Get.offNamed(named, preventDuplicates: false);
        }
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
