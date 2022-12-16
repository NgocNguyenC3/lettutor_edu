import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/course.dart';

class CourseDetailController extends BaseController {
  late Course course;
  @override
  void onInit() {
    super.onInit();
    course = Get.arguments[0];
  }

  @override
  void onReloadData() {}
}
