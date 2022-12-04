import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/data/services.dart/tutor_service.dart';
import 'package:lettutor_edu_clone/res/constants/local_string.dart';
import 'package:lettutor_edu_clone/util/validator.dart';
import 'package:lettutor_edu_clone/widgets/common/button/loading_button.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/baset_text_field.dart';
import 'package:lettutor_edu_clone/widgets/notification/notification_bar.dart';
import 'package:video_player/video_player.dart';

class TutorDetailController extends BaseController {
  final _tutorService = Get.find<TutorService>();
  final Rx<bool> isLoadingVideo = true.obs;
  final Rx<bool> isPlayingVideo = false.obs;
  final Rx<bool> isLoadingInit = true.obs;
  final Rx<bool> isFavorite = true.obs;
  final Rx<Tutor> tutor = Tutor().obs;
  final RxList<Schedule> schedules = <Schedule>[].obs;

  late String tutorId;

  final listSuggestCourse = [
    'Basic Conversation Topics:',
    'Life in the Internet Age:',
  ];

  late VideoPlayerController videoController;

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
    setUpData();
  }

  @override
  void onReloadData() {}

  @override
  void dispose() {
    videoController.pause();
    videoController.dispose();
    super.dispose();
  }

  onTapVideo() {
    isPlayingVideo.value = !isPlayingVideo.value;
    if (isPlayingVideo.value) {
      videoController.play();
    } else {
      videoController.pause();
    }
  }

  void setUpData() async {
    tutorId = Get.arguments['id'];
    try {
      await getDataTutor();
      await getDataSchedule();
      isFavorite.value = tutor.value.isFavorite;
      videoController = VideoPlayerController.network(tutor.value.video);
      videoController.initialize().then((value) {
        isLoadingVideo.value = false;
      });
      isLoadingInit.value = false;
    } catch (e) {
      print(e);
      isLoadingInit.value = true;
    }
  }

  onTapFavorite() {
    isFavorite.value = !isFavorite.value;
  }

  report() {
    final TextEditingController textReportController = TextEditingController();
    Get.bottomSheet(StatefulBuilder(builder: ((context, setState) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            baseTextField(
                controller: textReportController,
                hintText: LocalString.reportHint,
                isOutline: true,
                maxLine: 5,
                validator: ((value) {
                  if (value == null) {
                    return '';
                  }
                  if (value.isEmpty) {
                    return '';
                  }
                  return null;
                }),
                onChanged: (value) {}),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                width: 100,
                height: 30,
                child: LoadingButtonWidget(
                    isDisable: false,
                    submit: () {
                      handleReport(textReportController);
                    },
                    isLoading: false,
                    label: LocalString.confirm))
          ],
        ),
      );
    })));
  }

  void handleReport(textReportController) async {
    validatorEmpty([textReportController]);
    if (textReportController.text.isEmpty) {
      return;
    }
    try {
      final res =
          await _tutorService.reportTutor(textReportController.text, tutorId);
      Get.back();
      notificationBar(message: res['message'], isSuccess: true);
    } catch (e) {}
  }

  void review() {
    Get.toNamed(AppRoutes.REVIEW, arguments: {'id': tutorId});
  }

  getDataTutor() async {
    tutor.value = await _tutorService.getTutorById(tutorId);
  }

  getDataSchedule() async {
    final res = await _tutorService.getSchedule(tutorId);
    schedules.value = (res['scheduleOfTutor'] == null)
        ? []
        : (res['scheduleOfTutor'] as List)
            .map((e) => Schedule.fromJson(e))
            .toList();
  }


}
