import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/course/course_controller.dart';

class CourseBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CourseController());

  }
}
