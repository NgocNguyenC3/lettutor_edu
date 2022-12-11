import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lettutor_edu_clone/app/app_pages.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/data/services.dart/tutor_service.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';
import 'package:lettutor_edu_clone/res/constants/constants.dart';
import 'package:lettutor_edu_clone/widgets/common/text_field/label_english_type.dart';
import 'package:lettutor_edu_clone/widgets/wrap_field.dart';

class DashBoardController extends BaseController {
  final _tutorService = Get.find<TutorService>();
  final _userService = Get.find<UserService>();
  final listType = [
    'All',
    'english-for-kids',
    'business-english',
    'conversational-english',
    'starters',
    'movers',
    'flyers',
    'ket',
    'pet',
    'ielts',
    'toefl',
    'toeic',
  ];
  final Map<String, TextEditingController> controllers = Map.fromEntries(
    [nameField, dateField, dateStartField, dateEndField].map(
      (value) => MapEntry(
        value,
        TextEditingController(),
      ),
    ),
  );
  final Map<String, bool> nationality = {
    'isVietNamese': false,
    'isNative': false
  };

  final RxList<Widget> nations = <Widget>[].obs;
  RxInt totalPage = 1.obs;
  RxInt totalTime = 0.obs;
  RxBool loading = false.obs;
  RxString currentType = 'All'.obs;
  RxList<Tutor> listTuror = <Tutor>[].obs;

  FocusNode focusNode = FocusNode();

  @override
  void onInit() {
    super.onInit();
    setUpData();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        search();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  void onReloadData() {}

  void setUpData() async {
    try {
      final res = await _tutorService.getAllTutorByPage();
      final resTotal = await _userService.getTotalTime();
      totalTime.value = resTotal['total'];
      print(totalTime.value);
      listTuror.value = (res['tutors']['rows'] as List)
          .map((e) => Tutor.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
    }
  }

  void search() async {
    loading.value = true;
    try {
      final res = await _tutorService.getAllTutorBySearch(
          //nationality: nationality,
          search: controllers[nameField]!.text,
          specialties: [
            if (currentType.value != listType[0]) currentType.value,
          ]);
      listTuror.value =
          (res['rows'] as List).map((e) => Tutor.fromJson(e)).toList();
    } catch (e) {}
    loading.value = false;
  }

  onTapType(String type) {
    currentType.value = type;
    search();
  }

  void onTapWrapField() {
    Get.bottomSheet(WrapBottom(
      content: nationalityContent,
      data: nationality,
      onTapItem: (key) {
        nationality[key] = !nationality[key]!;
        getListNation();
        search();
        Get.back();
      },
    ));
  }

  void getListNation() {
    List<Widget> widgets = [];
    for (String key in nationality.keys) {
      if (nationality[key]!) {
        widgets.add(LabelEnglishType(content: nationalityContent[key]!));
      }
    }
    nations.value = widgets;
  }

  void navigateTutorDetail(Tutor tutor) {
    Get.toNamed(AppRoutes.TUTOR_DETAIL, arguments: {'id': tutor.userId});
  }
}
