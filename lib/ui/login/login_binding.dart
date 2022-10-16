import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/login/login_controller.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}
