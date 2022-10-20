import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';

class ScheduleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ScheduleController());

  }
}
