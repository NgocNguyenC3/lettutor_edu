import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/course_detail/course_detail_controller.dart';

class CourseDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CourseDetailController());

  }
}
