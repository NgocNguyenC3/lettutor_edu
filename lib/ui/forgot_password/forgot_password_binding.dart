import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/forgot_password/forgot_password_controller.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ForgotPasswordController());
  }
}
