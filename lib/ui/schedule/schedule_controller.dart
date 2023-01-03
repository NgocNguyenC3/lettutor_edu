import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/colors/colors_core.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/res/dimens.dart';
import 'package:lettutor_edu_clone/res/theme/text_theme.dart';
import 'package:lettutor_edu_clone/widgets/common/button/base_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/text_field_drop_down.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';

class ScheduleController extends BaseController {
  final userService = Get.find<UserService>();
  final RxList<Schedule> schedules = <Schedule>[].obs;

  final RxInt currentNum = 1.obs;
  final RxInt totalPage = 1.obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReloadData() {}

  void getData({page = 1}) async {
    try {
      final res = await userService.getSchedule(page: page);
      int t = res['data']['count'] ?? 10;
      totalPage.value = (t / 10).ceil();
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
    } catch (e) {
      print(e);
    }
  }

  void cancelSchedule(Schedule schedule) {
    final TextEditingController textController = TextEditingController()
      ..text = '1';
    Get.bottomSheet(StatefulBuilder(
      builder: (context, setState) => Container(
        height: 250,
        decoration: BoxDecoration(color: whiteColor),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Lí do hủy buổi học này?',
                style: text16,
              ),
              SizedBox(
                height: 5.h,
              ),
              DropdownButton(
                  value: textController.text,
                  isExpanded: true, //Adding this property, does the magic
                  items: [
                    ...cancel.entries.map((e) => DropdownMenuItem(
                          value: e.key,
                          child: Text(e.value,
                              overflow: TextOverflow.ellipsis, style: text14),
                        ))
                  ],
                  onChanged: (val) {
                    setState(() {
                      textController.text = val!;
                    });
                  }),
              baseTextField(
                onChanged: (value) {},
                controller: null,
                hintText: 'Ghi chú thêm',
                maxLine: 3,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ButtonWidget(
                  text: LocalString.confirm,
                  onTap: () {
                    handleCancel(
                        schedule, int.tryParse(textController.text) ?? 1);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void handleCancel(Schedule schedule, int i) async {
    try {
      final res = await userService.cancelSchedule(
          scheduleDetailId: schedule.scheduleDetailInfo!.id, i: i);
      Get.back();
      notificationBar(message: res['message'] ?? 'Đã cố lỗi xảy ra');
    } catch (e) {
      notificationBar(message: 'Không thể xóa lịch học này', isSuccess: false);
    }
  }
}

final cancel = {
  '1': 'Reschedule at another time',
  '2': 'Busy at that time',
  '3': 'Asked by the tutor',
  '4': 'Other',
};
