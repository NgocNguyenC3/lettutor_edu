import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';
import 'package:sprintf/sprintf.dart';

class TutorService extends BaseService {
  Future<void> getAllTutorByPage({int page = 1}) async {
    final response = await get(sprintf(ALL_TUTOR, [page]));
    print(response);
  }
}
