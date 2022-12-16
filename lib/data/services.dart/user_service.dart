import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/response/api_response.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';

class UserService extends BaseService {
  Future<void> logAccount(
      {required String email,
      required String password,
      required bool isLogin}) async {
    final body = {"email": email, "password": password};
    final response = await post(isLogin ? LOGIN : REGISTER, data: body);

    saveUserInfo(response);
  }

  Future<ApiResponse> forgotPassword({required String email}) async {
    final body = {"email": email};
    final response = await post(FORGOT_PASSWORD, data: body);
    return ApiResponse.fromJson(response);
  }

  Future<void> getlanguages() async {
    final response = await get(GET_LANGUAGES);
    saveLanguages(response);
  }

  Future<dynamic> getTotalTime() async {
    final response = await get(TOTAL_TIME);
    return response;
  }

  Future<dynamic> getSchedule({page = 1, type = 0}) async {
    final data = type == 0
        ? {
            'page': page,
            'perPage': 20,
            'dateTimeGte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          }
        : {
            'page': page,
            'perPage': 20,
            'dateTimeLte': DateTime.now()
                .millisecondsSinceEpoch
                .toString()
                .substring(0, 13),
            'orderBy': 'meeting',
            'sortBy': 'desc',
          };
    final response = await get(SCHEDULE_ALL, params: data);
    return response;
  }

  Future<dynamic> uploadImage(File file) async {
    final dio.FormData formData = dio.FormData.fromMap(
        {'avatar': await dio.MultipartFile.fromFile(file.path)});

    final response = await post(UP_AVATAR, data: formData);
    saveUserInfoNotTokenNotUser(response);
    return response;
  }

  Future<void> getUserInfo() async {
    final response = await get(USER_INFO);
    saveUserInfoNotToken(response);
  }
}
