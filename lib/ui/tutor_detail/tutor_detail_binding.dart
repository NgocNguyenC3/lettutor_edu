import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/tutor_detail/tutor_detail_controller.dart';

class TutorDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(TutorDetailController());
  }
}
