import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';
import 'package:sprintf/sprintf.dart';

class CourseService extends BaseService {
  Future<dynamic> getAllCateGory() async {
    final response = await get(CONTENT_CATEGORY_COURSE);
    return response;
  }

  Future<dynamic> getAllCourse(
      {int page = 1, int type = 0, String q = ''}) async {
    final response = await get(sprintf(
        type == 0
            ? ALL_COURSE
            : type == 1
                ? ALL_E_BOOK
                : ALL_I_E_BOOk,
        [page, q]));
    return response;
  }
}
