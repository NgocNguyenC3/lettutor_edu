import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChangePasswordController());

  }
}
