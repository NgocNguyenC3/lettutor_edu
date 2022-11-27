import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';
import 'package:sprintf/sprintf.dart';

class TutorService extends BaseService {
  Future<dynamic> getAllTutorByPage({int page = 1}) async {
    final response = await get(sprintf(ALL_TUTOR, [page]));
    return response;
  }

  Future<dynamic> getAllTutorBySearch(
      {int page = 1,
      String search = '',
      String? date,
      List<String> specialties = const [],
      List<double?> time = const [null, null],
      nationality = const {}}) async {
    final body = {
      "filters": {
        "date": date,
        "nationality": nationality,
        "specialties": specialties,
        "tutoringTimeAvailable": time,
      },
      "page": page,
      "perPage": 9,
      "search": search
    };
    final response = await post(SEARCH_TUTOR, data: body);
    return response;
  }
}
