import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/schedule.dart';
import 'package:lettutor_edu_clone/data/services.dart/user_service.dart';

class HistoryController extends BaseController {
  final userService = Get.find<UserService>();
  final RxList<Schedule> schedules = <Schedule>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData(page: 1);
  }

  @override
  void onReloadData() {}

  void getData({page = 1}) async {
    try {
      final res = await userService.getSchedule(page: page, type: 1);
      schedules.value = (res['data'] == null)
          ? []
          : (res['data']['rows'] as List)
              .map((e) => Schedule.fromJson(e))
              .toList();
    } catch (e) {
      print(e);
    }
  }
}
