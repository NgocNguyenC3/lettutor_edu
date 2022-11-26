import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/services.dart/tutor_service.dart';

class DashBoardController extends BaseController {
  final _tutorService = Get.find<TutorService>();
  final listType = [
    'All',
    'English for kids',
    'English for Business',
    'Conversational',
    'STARTERS',
    'MOVERS',
    'FLYERS'
  ];
  @override
  void onInit() {
    super.onInit();
    _tutorService.getAllTutorByPage();
  }

  @override
  void onReloadData() {}
}
