import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/history/history_controller.dart';
import 'package:lettutor_edu_clone/ui/schedule/schedule_controller.dart';

class HistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HistoryController());
  }
}
