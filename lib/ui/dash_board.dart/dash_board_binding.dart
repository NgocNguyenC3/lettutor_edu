import 'package:get/get.dart';
import 'package:lettutor_edu_clone/ui/dash_board.dart/dash_board_controller.dart';

class DashBoardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DashBoardController());

  }
}
