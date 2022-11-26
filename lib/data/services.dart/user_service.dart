import 'package:get/get.dart';
import 'package:lettutor_edu_clone/controllers/app_controller.dart';
import 'package:lettutor_edu_clone/data/api_constants.dart';
import 'package:lettutor_edu_clone/data/models/user.dart';
import 'package:lettutor_edu_clone/data/rest_client.dart';
import 'package:lettutor_edu_clone/data/services.dart/base_service.dart';

class UserService extends BaseService {
  final _appController = Get.find<AppController>();
  Future<void> logAccount(
      {required String email,
      required String password,
      required bool isLogin}) async {
    final body = {"email": email, "password": password};
    final response = await post(isLogin ? LOGIN : REGISTER, data: body);

    saveUserInfo(response);
  }

  void saveUserInfo(response) {
    print(response['user']);
    _appController.userModel.value = UserModel.fromJson(response['user']);
    RestClient.instance.setToken(response['tokens']['access']['token']);
  }
}
