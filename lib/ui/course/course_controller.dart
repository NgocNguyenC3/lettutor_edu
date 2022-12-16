import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/course.dart';
import 'package:lettutor_edu_clone/data/services.dart/course_service.dart';

import '../../data/models/category.dart';

class CourseController extends BaseController {
  final courseService = Get.find<CourseService>();

  Map<String, String> courseCategory = {};
  Map<String, List<Course>> courseMap = {};

  RxList<Course> courses = <Course>[].obs;
  RxInt index = 0.obs;
  RxInt countPage = 0.obs;
  RxBool isLoadingCourse = false.obs;

  @override
  void onInit() {
    super.onInit();

    setUpData();
  }

  @override
  void onReloadData() {}

  onTapInDexTabBar(int i) {
    index.value = i;
    courseMap = {};
    getAllCourse();
  }

  void setUpData() async {
    getAllCourse();
  }

  void getAllCourse({int page = 1}) async {
    isLoadingCourse.value = true;
    try {
      final res =
          await courseService.getAllCourse(page: page, type: index.value);
      countPage.value = res['data']['count'];
      courses.value =
          (res['data']['rows'] as List).map((e) => Course.fromJson(e)).toList();
      convertMapCourse();
      isLoadingCourse.value = false;
    } catch (e) {
      print(e);
    }
  }

  void convertMapCourse() {
    for (Course i in courses) {
      for (Category c in i.categories) {
        if (courseMap[c.key] != null) {
          courseMap[c.key]!.add(i);
        } else {
          courseMap[c.key] = [i];
        }
      }
    }
  }
}
