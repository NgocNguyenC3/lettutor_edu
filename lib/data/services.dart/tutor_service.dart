import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/models/feed_back.dart';
import 'package:lettutor_edu_clone/data/models/tutor.dart';
import 'package:lettutor_edu_clone/data/response/api_response.dart';
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

  Future<Tutor> getTutorById(String tutorId) async {
    final response = await get(sprintf(GET_TUTOR, [tutorId]));
    return Tutor.fromJson(response);
  }

  Future<dynamic> reportTutor(String text, String tutorId) async {
    final body = {'content': text, 'tutorId': tutorId};
    final response = await post(REPORT_TUTOR, data: body);
    return response;
  }

  Future<dynamic> feedBack(String tutorId, {int page = 1}) async {
    final response = await get(sprintf(REVIEW_TUTOR, [tutorId, page]));
    return response;
  }

  Future<dynamic> getSchedule(String tutorId) async {
    // final data = {
    //   'tutorId': tutorId,
    //   'startTimestamp': 1670086800000,
    //   'endTimestamp': 1670691599999,
    // };
    final data = {
      'tutorId': tutorId,
      'startTimestamp': DateTime.now()
          .subtract(const Duration(days: 1))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
      'endTimestamp': DateTime.now()
          .add(const Duration(days: 5))
          .millisecondsSinceEpoch
          .toString()
          .substring(0, 13),
    };
    final response = await get(SCHEDULE, params: data);
    return response;
  }

  Future<ApiResponse> book({required String scheduleDetailIds}) async {
    final data = {
      'scheduleDetailIds': [scheduleDetailIds],
      'note': '',
    };
    final response = await post(BOOKING, data: data);
    return ApiResponse.fromJson(response);
  }
}
