import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/data/response/api_response.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
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
}
