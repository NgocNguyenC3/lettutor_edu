import 'package:lettutor_edu_clone/controllers/base_controller.dart';

class DashBoardController extends BaseController {
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
  }

  @override
  void onReloadData() {}
}
