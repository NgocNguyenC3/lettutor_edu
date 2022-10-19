import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/change_password/change_password_controller.dart';
import 'package:lettutor_edu_clone/ui/review/review_controller.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ReviewController());

  }
}
