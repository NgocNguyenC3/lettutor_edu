import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/profile/profile_controller.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
  }
}
