import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/base_controller.dart';
import 'package:lettutor_edu_clone/data/models/feed_back.dart';
import 'package:lettutor_edu_clone/data/services.dart/tutor_service.dart';

class ReviewController extends BaseController {
  final _tutorService = Get.find<TutorService>();

  String tutorId = '';
  RxList<Feedback> feedBack = <Feedback>[].obs;

  @override
  void onInit() {
    super.onInit();
    isHaveDrawer = false;
    tutorId = Get.arguments['id'];
    getData(page: 1);
  }

  @override
  void onReloadData() {}

  void getData({required int page}) async {
    try {
      final res = await _tutorService.feedBack(tutorId, page: page);
      final data = res['data']['rows'];
      feedBack.value = (data == null)
          ? []
          : (data as List).map((e) => Feedback.fromJson(e)).toList();
    } catch (e) {}
  }
}
